package com.doptori.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.doptori.entity.Board;
import com.doptori.entity.Member;
import com.doptori.entity.Reserve;
import com.doptori.mapper.BoardMapper;
import com.doptori.mapper.ReserveMapper;

@Controller
public class ReserveController {
	
	@Autowired
	private ReserveMapper mapper;
	
	@Autowired
	private BoardMapper member_mapper;
	
	  
	@GetMapping("/reservation.do")
	public String reservation(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		List<Reserve> ReserveList = mapper.ReserveList(loginMember.getMb_num());
		List<String> memberNames = new ArrayList<>();
		for (Reserve reserve : ReserveList) {
			memberNames.add(member_mapper.memberNum2Name(reserve.getRe_mb_numb()));
			List<Board> list = mapper.ReservedBoard(reserve.getRe_num());
			if(list.size()!=0) {
				reserve.setConfirmed(1);
			}else {
				reserve.setConfirmed(0);
			}
		}
		model.addAttribute("list", ReserveList);
		model.addAttribute("memberNames", memberNames);
		
		List<Reserve> ReserveList4buyer = mapper.ReserveList4buyer(loginMember.getMb_num());
		List<String> memberNames4buyer = new ArrayList<>();
		for (Reserve reserve : ReserveList4buyer) {
			memberNames4buyer.add(member_mapper.memberNum2Name(reserve.getRe_num()));
			List<Board> list = mapper.ReservedBoard(reserve.getRe_bd_num());
			if(list.size()!=0) {
				reserve.setConfirmed(1);
			}else {
				reserve.setConfirmed(0);
			}
		}
		model.addAttribute("list4buyer", ReserveList4buyer);

		return "reservation";
		
	}

}
