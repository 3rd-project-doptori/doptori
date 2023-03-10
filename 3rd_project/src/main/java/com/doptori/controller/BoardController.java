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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import com.doptori.mapper.MemberMapper;

@Controller
public class BoardController {

	@Autowired
	private BoardMapper mapper;

	@Autowired
	private CommentMapper cmapper;
	
	@Autowired
	private MemberMapper mmapper;
	// @RequestMapping("/boardListFrom.do")
	// public void boardListFrom() {}

	@RequestMapping("/market.do")
	public String Market(Model model, HttpServletRequest request) {
		
		List<Board> list = mapper.searchBoardByType(3);

		//List<String> memberNames = new ArrayList<>();
		for (Board board : list) {
			//memberNames.add(mapper.memberNum2Name(board.getBd_mb_num()));
			if(board.getBd_pic()!=null) {
				if(board.getBd_pic().length()>53) {
					String temp = board.getBd_pic().substring(53);
					temp = temp.replace("\\", "/");
					board.setBd_pic(temp);
				}
			}
		}
		model.addAttribute("list", list);
		//model.addAttribute("memberNames", memberNames);

		
		// ????????? ?????? ????????? ??????
		int page,start;
		
		// ??? ???????????? ????????? ????????? ????????? ????????? ??????
		int pcnt;
		if(request.getParameter("pcnt") == null)
		    pcnt = 10;
		else
			pcnt = Integer.parseInt(request.getParameter("pcnt"));
		
		// ????????? ???????????? ?????? ??????????????? ?????????
		if(request.getParameter("page") == null) 
			page = 1;
		else 
			page = Integer.parseInt(request.getParameter("page"));
		
		start = (page-1)*pcnt;
		
		
		// ???????????? ???????????? ???????????? ?????? ???????????? ??????
		// pstart, pend
		int pstart,pend;
		
		pstart=page/10; 
		if(page%10 == 0)
			pstart--;
		
		pstart = pstart*10+1;
		pend = pstart+9;
		
		// list??? ???????????? ????????????(sel)??? ????????????(sword)??? ?????? ????????????.
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

		
		// (??????)??? ???????????? ?????? ??? view??? ??????
		int chong = mapper.getChong(pcnt,sel,sword);
		 
		// (??????)??? ??????????????? pend??? ?????????  ?????? ??????
		if(chong < pend) 
			pend=chong;
		
		
		ArrayList<Board> list2 = mapper.list2(sel,sword,start,pcnt);
		model.addAttribute("list2",list2);
		model.addAttribute("page",page); // ?????? ?????????
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong); // ????????????
		model.addAttribute("pcnt",pcnt);  // ???????????? ????????? ??????
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

		
		// ????????? ?????? ????????? ??????
		int page,start;
		
		// ??? ???????????? ????????? ????????? ????????? ????????? ??????
		int pcnt;
		if(request.getParameter("pcnt") == null)
		    pcnt = 10;
		else
			pcnt = Integer.parseInt(request.getParameter("pcnt"));
		
		// ????????? ???????????? ?????? ??????????????? ?????????
		if(request.getParameter("page") == null) 
			page = 1;
		else 
			page = Integer.parseInt(request.getParameter("page"));
		
		start = (page-1)*pcnt;
		
		
		// ???????????? ???????????? ???????????? ?????? ???????????? ??????
		// pstart, pend
		int pstart,pend;
		
		pstart=page/10; 
		if(page%10 == 0)
			pstart--;
		
		pstart = pstart*10+1;
		pend = pstart+9;
		
		// list??? ???????????? ????????????(sel)??? ????????????(sword)??? ?????? ????????????.
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

		
		// (??????)??? ???????????? ?????? ??? view??? ??????
		int chong = mapper.getChong(pcnt,sel,sword);
		 
		// (??????)??? ??????????????? pend??? ?????????  ?????? ??????
		if(chong < pend) 
			pend=chong;
		
		
		ArrayList<Board> list2 = mapper.list2(sel,sword,start,pcnt);
		model.addAttribute("list2",list2);
		model.addAttribute("page",page); // ?????? ?????????
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong); // ????????????
		model.addAttribute("pcnt",pcnt);  // ???????????? ????????? ??????
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

		
		// ????????? ?????? ????????? ??????
		int page,start;
		
		// ??? ???????????? ????????? ????????? ????????? ????????? ??????
		int pcnt;
		if(request.getParameter("pcnt") == null)
		    pcnt = 10;
		else
			pcnt = Integer.parseInt(request.getParameter("pcnt"));
		
		// ????????? ???????????? ?????? ??????????????? ?????????
		if(request.getParameter("page") == null) 
			page = 1;
		else 
			page = Integer.parseInt(request.getParameter("page"));
		
		start = (page-1)*pcnt;
		
		
		// ???????????? ???????????? ???????????? ?????? ???????????? ??????
		// pstart, pend
		int pstart,pend;
		
		pstart=page/10; 
		if(page%10 == 0)
			pstart--;
		
		pstart = pstart*10+1;
		pend = pstart+9;
		
		// list??? ???????????? ????????????(sel)??? ????????????(sword)??? ?????? ????????????.
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

		
		// (??????)??? ???????????? ?????? ??? view??? ??????
		int chong = mapper.getChong(pcnt,sel,sword);
		 
		// (??????)??? ??????????????? pend??? ?????????  ?????? ??????
		if(chong < pend) 
			pend=chong;
		
		
		ArrayList<Board> list2 = mapper.list2(sel,sword,start,pcnt);
		model.addAttribute("list2",list2);
		model.addAttribute("page",page); // ?????? ?????????
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong); // ????????????
		model.addAttribute("pcnt",pcnt);  // ???????????? ????????? ??????
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
	
	@RequestMapping("/market_detail.do/{bd_num}")
	public String getmarket_detail(@PathVariable("bd_num") int bd_num, Model model, HttpServletRequest request) {
		Board vo;
		vo = mapper.boardContent(bd_num);
		Member writer = mapper.getMember(vo.getBd_mb_num());
		if (writer != null) {
			vo.setMb_nick(writer.getMb_nick());
		}
		
		if(vo.getBd_pic()!=null) {
			if(vo.getBd_pic().length()>53) {
				String temp = vo.getBd_pic().substring(53);
				temp = temp.replace("\\", "/");
				vo.setBd_pic(temp);
			}
		}
		
		List<Comment> list = mapper.commentSelect(bd_num);
				model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		
		
		return "market_detail";
	}
	
	@RequestMapping("/boardInsertForm.do")
	public void boardInsertForm() {
	}

	@RequestMapping("/boardInsert.do")
	public String boardInsert(Board vo//, @RequestParam("bd_pic") MultipartFile file
			) throws IOException  {	
		
		// ?????? ????????? ??????
		  String bd_pic = null; 
		  MultipartFile uploadFile = vo.getUploadFile(); 
		  if (!uploadFile.isEmpty()) { 
			  String originalFileName = uploadFile.getOriginalFilename(); 
			  String ext = FilenameUtils.getExtension(originalFileName); //????????? ?????????
			  UUID uuid = UUID.randomUUID(); //UUID ?????????
			  String[] uuids = uuid.toString().split("-");

			  String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."),originalFileName.length());
			  String uniqueName = uuids[0];
			  System.out.println("????????? ???????????????" + uniqueName);
			  System.out.println("????????????" + fileExtension);

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
		
		if(vo.getBd_type()==3) {
			return "redirect:/market.do";
		}

		return "redirect:/QnA_List2.do";
	}
	
	@RequestMapping("/boardInsertForm2.do")
	public void boardInsertForm2() {
	}

	
//	@RequestMapping("/boardInsert.do")
//	public String noticeInsert(Board vo) throws IOException {
//		// ?????? ????????? ??????
//		String bd_pic = null;
//		MultipartFile uploadFile = vo.getUploadFile();
//		if (!uploadFile.isEmpty()) {
//			String originalFileName = uploadFile.getOriginalFilename();
//			String ext = FilenameUtils.getExtension(originalFileName);	//????????? ?????????
//			UUID uuid = UUID.randomUUID();	//UUID ?????????
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
//		// ?????? ????????? ??????
//		String bd_pic = null;
//		MultipartFile uploadFile = vo.getUploadFile();
//		if (!uploadFile.isEmpty()) {
//			String originalFileName = uploadFile.getOriginalFilename();
//			String ext = FilenameUtils.getExtension(originalFileName);	//????????? ?????????
//			UUID uuid = UUID.randomUUID();	//UUID ?????????
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
//		// ????????? ????????????
//		mapper.boardCount(bd_num);
//        
//		model.addAttribute("vo", vo);
//		//model.addAttribute("cvo", cvo);
//		
//		List<Comment> list = mapper.commentSelect(bd_num);
//		//model.addAttribute("list", list);
//		if (co_bd_num != null) {
//	        model.addAttribute("co_bd_num", co_bd_num); // FlashAttribute??? ???????????? ????????? ??????
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
//	        model.addAttribute("co_bd_num", co_bd_num); // FlashAttribute??? ???????????? ????????? ??????
//	    }
//	    return "boardContent";
//	}

//	@RequestMapping("/boardContent.do/{bd_num}")
//	public String boardContent(@PathVariable("bd_num") int bd_num, Model model, @RequestParam(value = "co_bd_num", defaultValue = "0") int co_bd_num) {
//	    Board vo;
//	    try {
//	        vo = mapper.boardContent(bd_num);
//	        if (vo == null) {
//	            throw new Exception("?????? ???????????? ???????????? ????????????.");
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
	
	@PostMapping("/Search.do")
	public String Search(HttpServletRequest httpServletRequest, Model model) {
		int bd_type = Integer.valueOf(httpServletRequest.getParameter("bd_type"));
		String searchType = httpServletRequest.getParameter("searchType");
		String query = httpServletRequest.getParameter("query");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("bd_type",bd_type);
		List<Board> list = null;
		
		switch(searchType){
		case "title":
			map.put("bd_title",query);
			list = mapper.searchByTitle(map);
			break;
		case "cont":
			map.put("bd_cont",query);
			list = mapper.searchByCont(map);
			break;
		case "nick":
			//?????? ????????? -> ?????? ????????? ????????? ???
			Object bd_mb_num = mmapper.Nick2Num(query);
			if(bd_mb_num!=null) {
				map.put("bd_mb_num",(int) bd_mb_num);
				list = mapper.searchByNick(map);
				for (Board board : list) {
					board.setMb_nick(query);
				}
			}
			break;

		default:
			System.out.println("Search : ????????? ???????????????.");
		}
		List<Board> noticelist = null;
		List<Board> qnalist = null;
		switch(bd_type) {
		case 1:
			noticelist = list;
			qnalist = mapper.qnalist();
			model.addAttribute("qnalist", qnalist);
			model.addAttribute("noticelist", noticelist);
			break;
		case 2:
			noticelist = mapper.noticelist();
			qnalist = list;
			model.addAttribute("showQnA", '1');
			model.addAttribute("qnalist", qnalist);
			model.addAttribute("noticelist", noticelist);
			break;
		case 3:
			for (Board board : list) {
				if(board.getBd_pic()!=null) {
					if(board.getBd_pic().length()>53) {
						String temp = board.getBd_pic().substring(53);
						temp = temp.replace("\\", "/");
						board.setBd_pic(temp);
					}
				
			}
			}
			model.addAttribute("list", list);
			return "market";
		default:
			System.out.println("????????? ?????? ???????????????");
		}		

		return "QnA_List2";
	}
	
	
	@RequestMapping("/boardContent.do/{bd_num}")
	public String boardContent(@PathVariable("bd_num") int bd_num, Model model, HttpServletRequest request, @RequestParam(value = "co_bd_num", defaultValue = "0") int co_bd_num) {
	    Board vo;
	    try {
	    	vo = mapper.boardContent(bd_num);
	        if (vo == null) {
	            throw new Exception("?????? ???????????? ???????????? ????????????.");
	        }
	        
	        //????????? ??????
	        mapper.boardCount(bd_num);
	        
	        // ?????? ?????? ??????!
	        List<Comment> list = mapper.commentSelect(bd_num);
	        
	        //?????? : ???????????? ????????? ????????? ???????????? ???
			/*
			 * for (Comment cvo : list) { // ?????? ???????????? ????????? ?????? ?????? Member co_writer =
			 * mapper.getMember(cvo.getCo_mb_num()); if (co_writer != null) { String
			 * fileName = co_writer.getMb_pic(); String realPath =
			 * "C:\\Users\\user\\git\\doptori\\3rd_project\\src\\main\\webapp\\resources\\images\\"
			 * + fileName; File file = new File(realPath); if(file.exists()) { try {
			 * InputStream inputStream = new FileInputStream(file); byte[] bytes = new
			 * byte[(int) file.length()]; inputStream.read(bytes); String base64 = new
			 * String(Base64.getEncoder().encode(bytes)); String mb_pic_path =
			 * "data:image/jpeg;base64," + base64; cvo.setMb_pic(mb_pic_path);
			 * inputStream.close(); } catch (IOException e) { e.printStackTrace(); } } } }
			 */
	        
	        
	        if (co_bd_num != 0) {
	            model.addAttribute("co_bd_num", co_bd_num);
	        }
	        
	        // Board ???????????? mb_nick(?????????) ??????
	        Member writer = mapper.getMember(vo.getBd_mb_num());
	        if (writer != null) {
	            vo.setMb_nick(writer.getMb_nick());
	        }
	        	 
	        // Board ???????????? mb_pic(????????? ??????) ??????
	        Member mb_pic = mapper.getMember(vo.getBd_mb_num());
	        if (mb_pic != null) {
	            String fileName = mb_pic.getMb_pic();
	            // ????????? ?????? ??????
	            String realPath = "C:\\Users\\user\\git\\doptori\\3rd_project\\src\\main\\webapp\\resources\\images\\" + fileName;
	            // ????????? ???????????? Base64 ??????????????? model??? ??????
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
	        
	        
	        //??????: ????????? ????????? ?????? ??????
			if(vo.getBd_pic()!=null) {
				if(vo.getBd_pic().length()>53) {
					String temp = vo.getBd_pic().substring(53);
					temp = temp.replace("\\", "/");
					vo.setBd_pic(temp);
				}
			}

	        model.addAttribute("vo", vo);
	        model.addAttribute("list", list);
	       
	        // ???????????? ????????? ?????? ??????
	        if (vo.getMb_pic() != null) {
	            model.addAttribute("mb_pic", vo.getMb_pic());
	        }
	        
	        
	        //???????????? ???????????? ???
			/*
			 * // ?????? ????????? ????????? ?????? ?????? if (vo.getBd_pic() != null) { String bd_pic =
			 * vo.getBd_pic(); String ext = FilenameUtils.getExtension(bd_pic); String
			 * filename = FilenameUtils.getName(bd_pic); String mimeType =
			 * URLConnection.guessContentTypeFromName(filename);
			 * 
			 * if (mimeType == null) { mimeType = "application/octet-stream"; }
			 * 
			 * byte[] bytes = Files.readAllBytes(Paths.get(bd_pic));
			 * model.addAttribute("bd_pic", "data:" + mimeType + ";base64," +
			 * Base64.getEncoder().encodeToString(bytes)); model.addAttribute("bd_pic_ext",
			 * ext); }
			 */

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
		// ????????? ?????? ????????????
		Board parent = mapper.boardContent(vo.getBd_num());
		// ????????? bd_group ??????
		vo.setBd_group(parent.getBd_group());
		// ????????? bd_seq??? ???????????? bd_seq+1
		vo.setBd_seq(parent.getBd_seq());
		// ????????? bd_level??? ???????????? bd_level+1
		vo.setBd_level(parent.getBd_level()+1);
		// ????????? ???????????? ?????? ????????? ?????? ?????? (bd_seq +1)
		mapper.replySeqUpdate(parent);
		// ?????? ??????
		mapper.replyInsert(vo);
		
		return "redirect:/QnA_List.do";
	}
	
	@PostMapping("/boardReply2.do")
	public String boardReply2(Board vo) {
		// ????????? ?????? ????????????
		Board parent = mapper.boardContent(vo.getBd_num());
		// ????????? bd_group ??????
		vo.setBd_group(parent.getBd_group());
		// ????????? bd_seq??? ???????????? bd_seq+1
		vo.setBd_seq(parent.getBd_seq());
		// ????????? bd_level??? ???????????? bd_level+1
		vo.setBd_level(parent.getBd_level()+1);
		// ????????? ???????????? ?????? ????????? ?????? ?????? (bd_seq +1)
		mapper.replySeqUpdate(parent);
		// ?????? ??????
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
//		 ra.addFlashAttribute("co_bd_num", cvo.getCo_bd_num()); // ??????????????? ??? ????????? ????????? ?????? FlashAttribute ??????
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
	        ra.addAttribute("bd_num", cvo.getCo_bd_num());
	        return "redirect:/boardContent.do/" + cvo.getCo_bd_num(); // ????????? ????????? ????????? ???????????? ??????
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "redirect:/QnA_List2.do";
	    }
	}
	
	
	// ?????? ??????
//	@RequestMapping("/commentInsert.do")
//	public String commentInsert(Comment cvo) {
//		mapper.commentInsert(cvo);
//		return "redirect:/boardContent.do?co_num=" + cvo.getCo_bd_num();
//	}
	
	// ?????? ??????
	
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