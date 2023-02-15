package com.doptori.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doptori.entity.Member;
import com.doptori.entity.farmdiary_manage;
import com.doptori.mapper.FarmDiaryManageMapper;

@Controller
public class AnalysisController {
	
	@Autowired
	private FarmDiaryManageMapper mapper;
	
	@RequestMapping("/AnalysisInsert.do")
	public String AnalysisInsert(farmdiary_manage vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		String pic = request.getParameter("pic");
		System.out.println(pic);
		mapper.AnalysisInsert(pic, loginMember.getMb_num());
		return "redirect:/Main.do";
	}
	
}
