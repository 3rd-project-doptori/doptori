package com.doptori.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.doptori.entity.Chatroom;
import com.doptori.entity.Member;
import com.doptori.mapper.ChattingMapper;
import com.doptori.mapper.MemberMapper;

@Controller
public class ChattingController {
	
	@Autowired
	public MemberMapper mapper;
	
	@Autowired
	public ChattingMapper chatting_mapper;
	
	@GetMapping("/chatting_list.do")
	public String chatting_list(Model model, HttpServletRequest request) {
		//mb_chatlist에 있는거 구분자로 나눠서 룸 번호 리스트 만듦
		//룸 번호 리스트 add함
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		String[] RoomList = loginMember.getMb_chatlist().split("\\|");
		//chatroom조회로 룸 생성자 번호 찾음
		//룸 생성자 번호에 해당하는 Member vo 리스트로 만들어서 add
		List<Chatroom> temp = new ArrayList<>();
		for (String string : RoomList) {
			temp.add(chatting_mapper.selectChatroom(Integer.parseInt(string)));
		}
		List<Member> list = new ArrayList<>();
		for (Chatroom chatroom : temp) {
			list.add(mapper.selectMember(chatroom.getCr_mb_num()));
		}
		model.addAttribute("list", list);
		
		return "chatting_list";
	}
	

}
