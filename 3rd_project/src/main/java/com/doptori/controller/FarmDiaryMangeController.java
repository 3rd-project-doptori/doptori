package com.doptori.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.doptori.entity.Member;
import com.doptori.entity.farmdiary_manage;
import com.doptori.mapper.FarmDiaryManageMapper;

@Controller
public class FarmDiaryMangeController {

	@Autowired
	private FarmDiaryManageMapper mapper;
	
	@RequestMapping("/FarmDiaryManage.do")
	public String FarmDiaryManageInsert(farmdiary_manage vo) {
		mapper.FarmDiaryManageInsert(vo);
		return "redirect:/FarmDiaryManageList2.do";
	}
	
	@RequestMapping("/FarmDiaryManageList2.do")
	public String FarmDiaryManageList2(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		 Member loginMember = (Member) session.getAttribute("loginMember");
		List<farmdiary_manage> list = mapper.FarmDiaryManageList2(loginMember.getMb_num());
		model.addAttribute("list", list);
		return "farm_management";
	}
	
}
