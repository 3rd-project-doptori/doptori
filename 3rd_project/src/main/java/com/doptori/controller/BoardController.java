package com.doptori.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLConnection;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doptori.entity.Board;
import com.doptori.entity.Comment;
import com.doptori.entity.Member;
import com.doptori.mapper.BoardMapper;
import com.doptori.mapper.CommentMapper;

@Controller
public class BoardController {

	@Autowired
	private BoardMapper mapper;

	@Autowired
	private CommentMapper cmapper;
	
	// @RequestMapping("/boardListFrom.do")
	// public void boardListFrom() {}

	@RequestMapping("/market.do")
	public String Market(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");

		List<Board> list = mapper.boardList(loginMember.getMb_num());

		List<String> memberNames = new ArrayList<>();
		for (Board board : list) {
			memberNames.add(mapper.memberNum2Name(board.getBd_mb_num()));
		}
		model.addAttribute("list", list);
		model.addAttribute("memberNames", memberNames);

		
		// 게시판 목록 페이징 처리
		int page,start;
		
		// 한 페이지의 레코드 갯수를 구하여 변수에 저장
		int pcnt;
		if(request.getParameter("pcnt") == null)
		    pcnt = 10;
		else
			pcnt = Integer.parseInt(request.getParameter("pcnt"));
		
		// 원하는 페이지의 시작 인덱스값을 구하기
		if(request.getParameter("page") == null) 
			page = 1;
		else 
			page = Integer.parseInt(request.getParameter("page"));
		
		start = (page-1)*pcnt;
		
		
		// 사용자가 페이지를 이동하기 위해 출력하는 범위
		// pstart, pend
		int pstart,pend;
		
		pstart=page/10; 
		if(page%10 == 0)
			pstart--;
		
		pstart = pstart*10+1;
		pend = pstart+9;
		
		// list를 가져올때 검색필드(sel)와 검색단어(sword)를 같이 전달한다.
		String sel;
		if(request.getParameter("sel")==null)
			sel="bd_title";
		else
			sel=request.getParameter("sel");
						
		String sword;
		if(request.getParameter("sword")==null)
			sword="";
		else
			sword=request.getParameter("sword");

		
		// (전체)총 페이지를 구한 후 view에 전달
		int chong = mapper.getChong(pcnt,sel,sword);
		 
		// (전체)총 페이지보다 pend가 크다면  값을 변경
		if(chong < pend) 
			pend=chong;
		
		
		ArrayList<Board> list2 = mapper.list2(sel,sword,start,pcnt);
		model.addAttribute("list2",list2);
		model.addAttribute("page",page); // 현재 페이지
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong); // 총페이지
		model.addAttribute("pcnt",pcnt);  // 페이지당 레코드 갯수
		model.addAttribute("sel",sel);
		model.addAttribute("sword",sword);

		
		return "market";
	}
	
	@RequestMapping("/QnA_List2.do")
	public String qnalist(Model model, HttpServletRequest request) {	
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		
		List<Board> qnalist = mapper.qnalist();
		List<Board> noticelist = mapper.noticelist();
		model.addAttribute("qnalist", qnalist);
		model.addAttribute("noticelist", noticelist);
		return "QnA_List2";
	}

	@RequestMapping("/QnA_List.do")
	public String QnA_List(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");

		List<Board> list = mapper.boardList(loginMember.getMb_num());

		List<String> memberNames = new ArrayList<>();
		for (Board board : list) {
			memberNames.add(mapper.memberNum2Name(board.getBd_mb_num()));
		}
		model.addAttribute("list", list);
		model.addAttribute("memberNames", memberNames);

		
		// 게시판 목록 페이징 처리
		int page,start;
		
		// 한 페이지의 레코드 갯수를 구하여 변수에 저장
		int pcnt;
		if(request.getParameter("pcnt") == null)
		    pcnt = 10;
		else
			pcnt = Integer.parseInt(request.getParameter("pcnt"));
		
		// 원하는 페이지의 시작 인덱스값을 구하기
		if(request.getParameter("page") == null) 
			page = 1;
		else 
			page = Integer.parseInt(request.getParameter("page"));
		
		start = (page-1)*pcnt;
		
		
		// 사용자가 페이지를 이동하기 위해 출력하는 범위
		// pstart, pend
		int pstart,pend;
		
		pstart=page/10; 
		if(page%10 == 0)
			pstart--;
		
		pstart = pstart*10+1;
		pend = pstart+9;
		
		// list를 가져올때 검색필드(sel)와 검색단어(sword)를 같이 전달한다.
		String sel;
		if(request.getParameter("sel")==null)
			sel="bd_title";
		else
			sel=request.getParameter("sel");
						
		String sword;
		if(request.getParameter("sword")==null)
			sword="";
		else
			sword=request.getParameter("sword");

		
		// (전체)총 페이지를 구한 후 view에 전달
		int chong = mapper.getChong(pcnt,sel,sword);
		 
		// (전체)총 페이지보다 pend가 크다면  값을 변경
		if(chong < pend) 
			pend=chong;
		
		
		ArrayList<Board> list2 = mapper.list2(sel,sword,start,pcnt);
		model.addAttribute("list2",list2);
		model.addAttribute("page",page); // 현재 페이지
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong); // 총페이지
		model.addAttribute("pcnt",pcnt);  // 페이지당 레코드 갯수
		model.addAttribute("sel",sel);
		model.addAttribute("sword",sword);

		
		return "QnA_List";
	}

	
	@RequestMapping("/notice.do")
	public String notice(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");

		List<Board> list = mapper.boardList(loginMember.getMb_num());

		List<String> memberNames = new ArrayList<>();
		for (Board board : list) {
			memberNames.add(mapper.memberNum2Name(board.getBd_mb_num()));
		}
		model.addAttribute("list", list);
		model.addAttribute("memberNames", memberNames);

		
		// 게시판 목록 페이징 처리
		int page,start;
		
		// 한 페이지의 레코드 갯수를 구하여 변수에 저장
		int pcnt;
		if(request.getParameter("pcnt") == null)
		    pcnt = 10;
		else
			pcnt = Integer.parseInt(request.getParameter("pcnt"));
		
		// 원하는 페이지의 시작 인덱스값을 구하기
		if(request.getParameter("page") == null) 
			page = 1;
		else 
			page = Integer.parseInt(request.getParameter("page"));
		
		start = (page-1)*pcnt;
		
		
		// 사용자가 페이지를 이동하기 위해 출력하는 범위
		// pstart, pend
		int pstart,pend;
		
		pstart=page/10; 
		if(page%10 == 0)
			pstart--;
		
		pstart = pstart*10+1;
		pend = pstart+9;
		
		// list를 가져올때 검색필드(sel)와 검색단어(sword)를 같이 전달한다.
		String sel;
		if(request.getParameter("sel")==null)
			sel="bd_title";
		else
			sel=request.getParameter("sel");
						
		String sword;
		if(request.getParameter("sword")==null)
			sword="";
		else
			sword=request.getParameter("sword");

		
		// (전체)총 페이지를 구한 후 view에 전달
		int chong = mapper.getChong(pcnt,sel,sword);
		 
		// (전체)총 페이지보다 pend가 크다면  값을 변경
		if(chong < pend) 
			pend=chong;
		
		
		ArrayList<Board> list2 = mapper.list2(sel,sword,start,pcnt);
		model.addAttribute("list2",list2);
		model.addAttribute("page",page); // 현재 페이지
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong); // 총페이지
		model.addAttribute("pcnt",pcnt);  // 페이지당 레코드 갯수
		model.addAttribute("sel",sel);
		model.addAttribute("sword",sword);

		
		return "notice";
	}
	
	
	@RequestMapping("/MyboardList.do")
	public String MyboardList(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");

		List<Board> list = mapper.boardList(loginMember.getMb_num());

		List<String> memberNames = new ArrayList<>();
		for (Board board : list) {
			memberNames.add(mapper.memberNum2Name(board.getBd_mb_num()));
		}
		model.addAttribute("list", list);
		model.addAttribute("memberNames", memberNames);
		
		return "MyboardList";
	}
	
	@RequestMapping("/market_detail.do")
	public String getmarket_detail() {
		return "market_detail";
	}
	
	@RequestMapping("/boardInsertForm.do")
	public void boardInsertForm() {
	}

	@RequestMapping("/boardInsert.do")
	public String boardInsert(Board vo//, @RequestParam("bd_pic") MultipartFile file
			) throws IOException  {
		
		// 파일 업로드 처리
		  String bd_pic = null; 
		  MultipartFile uploadFile = vo.getUploadFile(); 
		  if (!uploadFile.isEmpty()) { 
			  String originalFileName = uploadFile.getOriginalFilename(); 
			  String ext = FilenameUtils.getExtension(originalFileName); //확장자 구하기
			  UUID uuid = UUID.randomUUID(); //UUID 구하기
			  String[] uuids = uuid.toString().split("-");

			  String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."),originalFileName.length());
			  String uniqueName = uuids[0];
			  System.out.println("생성된 고유문자열" + uniqueName);
			  System.out.println("확장자명" + fileExtension);

			  String uploadFolder = "C:\\Users\\user\\git\\doptori\\3rd_project\\src\\main\\webapp\\resources\\images";


				bd_pic = uploadFolder+"\\"+ uniqueName + fileExtension;

				File saveFile = new File(bd_pic); 

				uploadFile.transferTo(saveFile);

			  //uploadFile.transferTo(new File("D:\\uploads\\" + bd_pic));
		  }
		  vo.setBd_pic(bd_pic);
		 
		/*
		 * String bd_pic = file.getOriginalFilename(); File f = new File("c:\\upload\\"
		 * + bd_pic);
		 * 
		 * try { file.transferTo(f); vo.setBd_pic(bd_pic);
		 * 
		 * } catch (IOException e) { e.printStackTrace(); }
		 */
		
		mapper.boardInsert(vo);

		return "redirect:/QnA_List2.do";
	}
	
	@RequestMapping("/boardInsertForm2.do")
	public void boardInsertForm2() {
	}

	
//	@RequestMapping("/boardInsert.do")
//	public String noticeInsert(Board vo) throws IOException {
//		// 파일 업로드 처리
//		String bd_pic = null;
//		MultipartFile uploadFile = vo.getUploadFile();
//		if (!uploadFile.isEmpty()) {
//			String originalFileName = uploadFile.getOriginalFilename();
//			String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
//			UUID uuid = UUID.randomUUID();	//UUID 구하기
//			bd_pic = uuid + "." + ext;
//			uploadFile.transferTo(new File("D:\\upload\\" + bd_pic));
//		}
//		vo.setBd_pic(bd_pic);
//		mapper.boardInsert(vo);
//
//		return "redirect:/notice.do";
//	}
	
	//@RequestMapping("/boardInsertForm3.do")
	//public void boardInsertForm3() {
	//}
//	@RequestMapping("/boardInsert.do")
//	public String TradeInsert(Board vo) throws IOException {
//		// 파일 업로드 처리
//		String bd_pic = null;
//		MultipartFile uploadFile = vo.getUploadFile();
//		if (!uploadFile.isEmpty()) {
//			String originalFileName = uploadFile.getOriginalFilename();
//			String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
//			UUID uuid = UUID.randomUUID();	//UUID 구하기
//			bd_pic = uuid + "." + ext;
//			uploadFile.transferTo(new File("D:\\upload\\" + bd_pic));
//		}
//		vo.setBd_pic(bd_pic);
//		mapper.boardInsert(vo);
//
//		return "redirect:/TradeList.do";
//	}
	/*
	 * @RequestMapping("/boardContent.do/{bd_num}") 
	 * public String boardContent(@PathVariable("bd_num")int the_bd_num, Model model) {
	 * 
	 * Board vo = mapper.boardContent(the_bd_num); 
	 * mapper.boardCount(the_bd_num);
	 * model.addAttribute("vo", vo);
	 * 
	 * 
	 * HttpSession session = request.getSession(); Member loginMember = (Member)
	 * session.getAttribute("loginMember");
	 * 
	 * Board board = mapper.boardContent(loginMember.getMb_num());
	 * 
	 * Board memberName = new Board();
	 * memberName.add(mapper.memberNum2Name(board.getBd_mb_num()));
	 * 
	 * model.addAttribute("board", board); model.addAttribute("memberName",
	 * memberName);
	 * 
	 * return "boardContent"; }
	 */
	
//	@RequestMapping("/boardContent.do/{bd_num}")
//	public String boardContent(@PathVariable("bd_num")int bd_num, Model model, @ModelAttribute("co_bd_num")int co_bd_num) {
//		Board vo = mapper.boardContent(bd_num);	
//		//Comment cvo = mapper.commentList(bd_num);
//		
//		// 조회수 업데이트
//		mapper.boardCount(bd_num);
//        
//		model.addAttribute("vo", vo);
//		//model.addAttribute("cvo", cvo);
//		
//		List<Comment> list = mapper.commentSelect(bd_num);
//		//model.addAttribute("list", list);
//		if (co_bd_num != null) {
//	        model.addAttribute("co_bd_num", co_bd_num); // FlashAttribute로 전달받은 데이터 처리
//	    }
//		
//		return "boardContent";
//		
//	}
	
//	@RequestMapping("/boardContent.do/{bd_num}")
//	public String boardContent(@PathVariable("bd_num") int bd_num, Model model, @RequestParam(value = "co_bd_num", defaultValue = "0") int co_bd_num) {
//	    Board vo = mapper.boardContent(bd_num);
//	    mapper.boardCount(bd_num);
//	    model.addAttribute("vo", vo);
//	    List<Comment> list = mapper.commentSelect(bd_num);
//	    model.addAttribute("list", list);
//	    if (co_bd_num != 0) {
//	        model.addAttribute("co_bd_num", co_bd_num); // FlashAttribute로 전달받은 데이터 처리
//	    }
//	    return "boardContent";
//	}

//	@RequestMapping("/boardContent.do/{bd_num}")
//	public String boardContent(@PathVariable("bd_num") int bd_num, Model model, @RequestParam(value = "co_bd_num", defaultValue = "0") int co_bd_num) {
//	    Board vo;
//	    try {
//	        vo = mapper.boardContent(bd_num);
//	        if (vo == null) {
//	            throw new Exception("해당 게시물이 존재하지 않습니다.");
//	        }
//	        mapper.boardCount(bd_num);
//	        List<Comment> list = mapper.commentSelect(bd_num);
//	        if (co_bd_num != 0) {
//	            model.addAttribute("co_bd_num", co_bd_num);
//	        }
//	        model.addAttribute("vo", vo);
//	        model.addAttribute("list", list);
//	    } catch (Exception e) {
//	        model.addAttribute("error", e.getMessage());
//	    }
//	    return "boardContent";
//	}
	
	
	@RequestMapping("/boardContent.do/{bd_num}")
	public String boardContent(@PathVariable("bd_num") int bd_num, Model model, HttpServletRequest request, @RequestParam(value = "co_bd_num", defaultValue = "0") int co_bd_num) {
	    Board vo;
	    try {
	    	vo = mapper.boardContent(bd_num);
	        if (vo == null) {
	            throw new Exception("해당 게시물이 존재하지 않습니다.");
	        }
	        
	        //조회수 출력
	        mapper.boardCount(bd_num);
	        
	        // 댓글 목록 출력!
	        List<Comment> list = mapper.commentSelect(co_bd_num);
	        
	        for (Comment cvo : list) {
	            // 댓글 작성자의 프로필 사진 추가
	            Member co_writer = mapper.getMember(cvo.getCo_mb_num());
	            if (co_writer != null) {
	                String fileName = co_writer.getMb_pic();
	                String realPath = "C:\\Users\\user\\git\\doptori\\3rd_project\\src\\main\\webapp\\resources\\images\\" + fileName;
	                File file = new File(realPath);
	                if(file.exists()) {
	                    try {
	                        InputStream inputStream = new FileInputStream(file);
	                        byte[] bytes = new byte[(int) file.length()];
	                        inputStream.read(bytes);
	                        String base64 = new String(Base64.getEncoder().encode(bytes));
	                        String mb_pic_path = "data:image/jpeg;base64," + base64;
	                        cvo.setMb_pic(mb_pic_path);
	                        inputStream.close();
	                    } catch (IOException e) {
	                        e.printStackTrace();
	                    }
	                }
	            }
	        }
	        
	        if (co_bd_num != 0) {
	            model.addAttribute("co_bd_num", co_bd_num);
	        }
	        
	        // Board 작성자의 mb_nick(닉네임) 추가
	        Member writer = mapper.getMember(vo.getBd_mb_num());
	        if (writer != null) {
	            vo.setMb_nick(writer.getMb_nick());
	        }
	        	 
	        // Board 작성자의 mb_pic(프로필 사진) 추가
	        Member mb_pic = mapper.getMember(vo.getBd_mb_num());
	        if (mb_pic != null) {
	            String fileName = mb_pic.getMb_pic();
	            // 저장된 경로 설정
	            String realPath = "C:\\Users\\user\\git\\doptori\\3rd_project\\src\\main\\webapp\\resources\\images\\" + fileName;
	            // 파일을 불러와서 Base64 인코딩하여 model에 추가
	            File file = new File(realPath);
	            if(file.exists()) {
	                InputStream inputStream = new FileInputStream(file);
	                byte[] bytes = new byte[(int) file.length()];
	                inputStream.read(bytes);
	                String base64 = new String(Base64.getEncoder().encode(bytes));
	                String mb_pic_path = "data:image/jpeg;base64," + base64;
	                vo.setMb_pic(mb_pic_path);
	                inputStream.close();
	            }
	        }
	        
	        model.addAttribute("vo", vo);
	        model.addAttribute("list", list);
	       
	        // 작성자의 프로필 사진 추가
	        if (vo.getMb_pic() != null) {
	            model.addAttribute("mb_pic", vo.getMb_pic());
	        }
	        
	        // 파일 이미지 출력을 위한 코드
	        if (vo.getBd_pic() != null) {
	            String bd_pic = vo.getBd_pic();
	            String ext = FilenameUtils.getExtension(bd_pic);
	            String filename = FilenameUtils.getName(bd_pic);
	            String mimeType = URLConnection.guessContentTypeFromName(filename);

	            if (mimeType == null) {
	                mimeType = "application/octet-stream";
	            }

	            byte[] bytes = Files.readAllBytes(Paths.get(bd_pic));
	            model.addAttribute("bd_pic", "data:" + mimeType + ";base64," + Base64.getEncoder().encodeToString(bytes));
	            model.addAttribute("bd_pic_ext", ext);
	        }

	    } catch (Exception e) {
	        model.addAttribute("error", e.getMessage());
	    }
	    return "boardContent";
	}

	
	@RequestMapping("/boardUpdateForm.do")
	public String boardUpdateForm(int bd_num, Model model) {
		Board vo = mapper.boardContent(bd_num);

		model.addAttribute("vo", vo);

		return "boardUpdateForm";
	}
	
	@PostMapping("/boardUpdate.do")
	public String boardUpdate(Board vo) {

		mapper.boardUpdate(vo);

		return "redirect:QnA_List2.do";
	}
	@PostMapping("/noticeUpdate.do")
	public String noticeUpdate(Board vo) {

		mapper.boardUpdate(vo);

		return "redirect:/notice.do";
	}
	
	@PostMapping("/boardUpdate3.do")
	public String boardUpdate3(Board vo) {
		
		mapper.boardUpdate(vo);
		
		return "redirect:market.do";
	}

	@RequestMapping("/boardDelete.do/{bd_num}")
	public String boardDelete(@PathVariable("bd_num") int bd_num, Model model) {

		mapper.boardDelete(bd_num);

		return "redirect:/QnA_List2.do";
	}
	
	@RequestMapping("/noticeDelete.do/{bd_num}")
	public String noticeDelete(@PathVariable("bd_num") int bd_num, Model model) {

		mapper.boardDelete(bd_num);

		return "redirect:/notice.do";
	}
	
	@RequestMapping("/boardDelete3.do/{bd_num}")
	public String boardDelete3(@PathVariable("bd_num") int bd_num, Model model) {

		mapper.boardDelete(bd_num);

		return "redirect:/market.do";
	}

	@GetMapping("/updateCount/{bd_num}")
	public Board updateCount(@PathVariable int bd_num) {

		mapper.updateCount(bd_num);

		Board vo = mapper.boardContent(bd_num);
		return vo;
	}
	
	@RequestMapping("/boardReplyForm.do") 
	public void boardReplyForm() { }
	
	@GetMapping("/boardReply.do")
	public String boardReply(int bd_num, Model model) {
		Board vo = mapper.boardReply(bd_num);
		model.addAttribute("vo", vo);
		
		Board parent = mapper.boardContent(bd_num);
		model.addAttribute("parent", parent);
		
		return "/boardReply";
	}
	
	@PostMapping("/boardReply.do")
	public String boardReply(Board vo) {
		// 부모글 정보 가져오기
		Board parent = mapper.boardContent(vo.getBd_num());
		// 답글의 bd_group 설정
		vo.setBd_group(parent.getBd_group());
		// 답글의 bd_seq를 부모글의 bd_seq+1
		vo.setBd_seq(parent.getBd_seq());
		// 답글의 bd_level을 부모글의 bd_level+1
		vo.setBd_level(parent.getBd_level()+1);
		// 답글을 저장하기 전에 답글의 순서 저정 (bd_seq +1)
		mapper.replySeqUpdate(parent);
		// 답글 저장
		mapper.replyInsert(vo);
		
		return "redirect:/QnA_List.do";
	}
	
	@PostMapping("/boardReply2.do")
	public String boardReply2(Board vo) {
		// 부모글 정보 가져오기
		Board parent = mapper.boardContent(vo.getBd_num());
		// 답글의 bd_group 설정
		vo.setBd_group(parent.getBd_group());
		// 답글의 bd_seq를 부모글의 bd_seq+1
		vo.setBd_seq(parent.getBd_seq());
		// 답글의 bd_level을 부모글의 bd_level+1
		vo.setBd_level(parent.getBd_level()+1);
		// 답글을 저장하기 전에 답글의 순서 저정 (bd_seq +1)
		mapper.replySeqUpdate(parent);
		// 답글 저장
		mapper.replyInsert(vo);
		
		return "redirect:/market.do";
	}


	
//	@RequestMapping("commentInsert.do")
//	public String commentInsert(Comment cvo, HttpSession session, RedirectAttributes ra) throws Exception {
//	
//		Member loginMember = (Member)session.getAttribute("loginMember");
//		cvo.setCo_mb_num(loginMember.getMb_num());
//	 
//		mapper.commentInsert(cvo);
//		 ra.addFlashAttribute("co_bd_num", cvo.getCo_bd_num()); // 리다이렉트 시 데이터 전달을 위해 FlashAttribute 사용
//		
//		return "redirect:/boardContent.do?bd_num=" + cvo.getCo_bd_num();
//	}
	
	
	@PostMapping("/commentInsert.do")
	public String commentInsert(Comment cvo, HttpSession session, RedirectAttributes ra) throws Exception {
	    Member loginMember = (Member) session.getAttribute("loginMember");
	    if (loginMember == null) {
	        return "redirect:/signin.do";
	    }
	    cvo.setCo_mb_num(loginMember.getMb_num());
	    try {
	        mapper.commentInsert(cvo);
	        ra.addAttribute("co_bd_num", cvo.getCo_bd_num());
	        return "redirect:/boardContent.do/" + cvo.getCo_bd_num(); // 댓글이 등록된 게시물 페이지로 이동
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "redirect:/QnA_List2.do";
	    }
	}
	
	
	// 댓글 입력
//	@RequestMapping("/commentInsert.do")
//	public String commentInsert(Comment cvo) {
//		mapper.commentInsert(cvo);
//		return "redirect:/boardContent.do?co_num=" + cvo.getCo_bd_num();
//	}
	
	// 댓글 삭제
	
//	@RequestMapping("/commentDelete.do")
//	public String commentDelete(@RequestParam("co_num") int co_num, @RequestParam("bd_num") int bd_num) {
//	    mapper.commentDelete(co_num);
//	    return "redirect:/boardContent.do?bd_num=" + bd_num;
//	}

	
	@PostMapping("/commentDelete")
	@ResponseBody
	public ResponseEntity<String> commentDelete(@RequestParam("co_num") int co_num, @RequestParam("bd_num") int bd_num) {
	    mapper.commentDelete(co_num);
	    return ResponseEntity.ok("success");
	}


}