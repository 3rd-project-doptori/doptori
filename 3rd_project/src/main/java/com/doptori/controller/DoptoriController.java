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
	
	@GetMapping("/FarmDiaryManage.do")
	public String FarmDiaryManage() {
		return "FarmDiaryManage";
	}

}
