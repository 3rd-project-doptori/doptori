package com.doptori.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.doptori.entity.Member;
import com.doptori.mapper.MemberMapper;

@Controller
public class MemberController {

	@Autowired
	private MemberMapper mapper;
	
	// 아이디 중복체크
	@RequestMapping("/mbidCheck.do")
	public @ResponseBody int mbidCheck(String mb_id) {
		int result = mapper.mbidCheck(mb_id);
		return result;
	}
	
	@PostMapping("/Login.do")
	public String Login(Member mvo, HttpServletRequest request) {
		// 로그인 기능 - 해당 아이디, 비밀번호 일치하는 회원의 정보 세션에 저장
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
	
	// 회원 정보 수정 페이지
	@RequestMapping("/updateMember.do")
	public String updateMember() {
		return "updateMember";
	}
    
	// 회원 정보 수정
	@RequestMapping("/userUpdate.do")
	public String userUpdate(Member mvo) {
		mapper.userUpdate(mvo);
		return "redirect:/Main.do";
	}
	
	
	@GetMapping("/Mypage.do")
	public String Mypage() {
		return "Mypage";
	}
	
}
