package com.doptori.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doptori.entity.Board;
import com.doptori.mapper.BoardMapper;

@Controller
public class DoptoriController {
	
	//@Autowired
	//private DoptoriMapper mapper;
	
	@Autowired
	private BoardMapper mapper;
	
	
	@GetMapping("/Main.do")
	public String Main(Board vo, Model model) {
		List<Board> list = mapper.MainboardList(vo);
		model.addAttribute("list", list);
		return "main";
	}
	
	@GetMapping("/signin.do")
	public String signin() {
		return "signin";
	}
	
	@GetMapping("/signup.do")
	public String signup() {
		return "signup";
	}
	
	@GetMapping("/analysis.do")
	public String analysis() {
		return "analysis";
	}
	@GetMapping("/analysis2.do")
	public String analysis2() {
		return "analysis2";
	}
	@GetMapping("/FarmDiaryManage.do")
	public String FarmDiaryManage() {
		return "FarmDiaryManage";
	}
	@GetMapping("/FarmDiaryList.do")
	public String farm_list() {
		return "farm_list";
	}
	@GetMapping("/farm_management.do")
	public String farm_management() {
		return "farm_management";
	}
	
	@GetMapping("/mypage.do")
	public String mypage() {
		return "mypage";
	}
	
	@GetMapping("/complain.do")
	public String complain() {
		return "complain";
	}
	@GetMapping("/writing.do")
	public String writing() {
		return "writing";
	}
	@GetMapping("/farm.do")
	public String farm() {	
		return "farm";
	}
	@GetMapping("/market_detail.do")
	public String market_detail() {	
		return "market_detail";
	}

	@GetMapping("/chatting_list.do")
	public String chatting_list() {
		return "chatting_list";
	}
	
	
}
