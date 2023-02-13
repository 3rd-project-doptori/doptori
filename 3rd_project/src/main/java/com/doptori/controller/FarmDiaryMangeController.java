package com.doptori.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doptori.entity.farmdiary_manage;
import com.doptori.mapper.FarmDiaryManageMapper;

@Controller
public class FarmDiaryMangeController {

	@Autowired
	private FarmDiaryManageMapper mapper;
	
	@RequestMapping("/FarmDiaryManage.do")
	public String FarmDiaryManageInsert(farmdiary_manage vo) {
		mapper.FarmDiaryManageInsert(vo);
		return "redirect:/Main.do";
	}
	
	
	
}
