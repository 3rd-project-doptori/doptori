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
import org.springframework.web.bind.annotation.RestController;

import com.doptori.entity.Address;
import com.doptori.entity.Farm;
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
		return "redirect:/farm_management.do";
	}
	
}
