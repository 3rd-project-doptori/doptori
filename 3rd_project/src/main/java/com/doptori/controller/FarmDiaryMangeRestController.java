package com.doptori.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RestController;

import com.doptori.entity.Farm;
import com.doptori.entity.Member;
import com.doptori.entity.farmdiary_manage;
import com.doptori.mapper.FarmDiaryManageMapper;

@RestController
public class FarmDiaryMangeRestController {

	@Autowired
	private FarmDiaryManageMapper mapper;
	
	
	
	@GetMapping("/FarmDiaryManageList.do")
	public List<farmdiary_manage> FarmDiaryManageList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		 Member loginMember = (Member) session.getAttribute("loginMember");
		List<farmdiary_manage> FarmDiaryManageList = mapper.FarmDiaryManageList(loginMember.getMb_num());
		System.out.println(FarmDiaryManageList);
		return FarmDiaryManageList;
	}
}
