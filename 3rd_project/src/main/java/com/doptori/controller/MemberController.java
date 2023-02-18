package com.doptori.controller;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doptori.entity.Member;
import com.doptori.mapper.MemberMapper;
import com.doptori.utils.UploadFileUtils;

@Controller
public class MemberController {
	
	@Autowired
	private MemberMapper mapper;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	
	// 아이디 중복체크
	/*
	 * @RequestMapping("/mbidCheck.do") public @ResponseBody int mbidCheck(String
	 * mb_id) { int result = mapper.mbidCheck(mb_id); return result; }
	 */
	
	@PostMapping("/Login.do")
	public String Login(Member mvo, HttpServletRequest request) {
		// 로그인 기능 - 해당 아이디, 비밀번호 일치하는 회원의 정보 세션에 저장z
		Member loginMember = mapper.MemberLogin(mvo);
		
		// 만약에 로그인 정보가 있으면 --> 세션에 정보를 저장
		if(loginMember != null) {
			// 1. 세션 객체 생성
			HttpSession session = request.getSession();
			// 2. 세션에 값을 setAttribute()
			session.setAttribute("loginMember", loginMember);
		}
		
		// basic.jsp로 이동
		// 다른 컨트롤러에 있는 메소드 실행
		return "redirect:/Main.do";
	}
	
	
	@RequestMapping("/Logout.do")
	public String Logout(HttpSession session) {
		session.removeAttribute("loginMember");
		return "redirect:/Main.do";
	}
	
	@RequestMapping("/signup.do")
	public String signup(Member vo) {
		mapper.MemberInsert(vo);
		return "redirect:/Main.do";
	}
	
	
	// 회원 정보 수정 페이지로 이동
	//@RequestMapping("/updateMember.do")
	//public String updateMember() {
	//	return "updateMember";
	//}
	@RequestMapping("/mypage.do")
	public void mypage() {}
	// 회원 정보 수정(update 이벤트)
	@RequestMapping("/userUpdate.do")
	public String userUpdate(Member mvo, HttpSession session)throws Exception {
		
		// 파일 업로드 처리
		  String mb_pic = null;
		  String mb_file = null;
		  MultipartFile uploadFile = mvo.getUploadFile(); 
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

			  
			  mb_pic = uniqueName + fileExtension;
			  mb_file = uploadFolder+"\\"+ uniqueName + fileExtension;

				File saveFile = new File(mb_file); 

				uploadFile.transferTo(saveFile);

		  }
		  mvo.setMb_pic(mb_pic);
		  mvo.setMb_file(mb_file);
		
		
		mapper.userUpdate(mvo);
		session.setAttribute("loginMember", mvo);
		return "redirect:/mypage.do";
	}
	
	
	
	// 회원 탈퇴 페이지 이동
	@RequestMapping("/memberDeleteView")
	public String memberDeleteView() {
		return "memberDeleteView";
	}
	// 회원탈퇴 시 로그인 한 회원의 비밀번호 일치 하는지
	@ResponseBody
	@RequestMapping("/passChk")
	public int passChk(Member vo) {
		int result = mapper.passChk(vo);
		return result;
	}
	// 회원 탈퇴 해버리기 (Delete 이벤트)
	@RequestMapping("/userDelete.do")
	public String userDelete(Member mvo, RedirectAttributes rttr, HttpSession session) {
		
		// 세션에 있는 member를 가져와 member변수에 넣어줌
		Member member = (Member) session.getAttribute("member");
		// 세션에있는 비밀번호
		String sessionPass = member.getMb_pw();
		// vo로 들어오는 비밀번호
		String voPass = mvo.getMb_pw();
		
		if(!(sessionPass.equals(voPass))) {
			
			rttr.addFlashAttribute("msg", false);
			return "redirect:/memberDeleteView";
		}
		mapper.userDelete(mvo);
		session.invalidate();
		
		return "redirect:/Main.do";
	}
	
//	
	
	//@GetMapping("/Mypage.do")
	//public String Mypage() {
	//	return "Mypage";
	//}
	
}
