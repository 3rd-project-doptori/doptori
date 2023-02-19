package com.doptori.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doptori.entity.Address;
import com.doptori.entity.Member;
import com.doptori.entity.farmdiary_manage;
import com.doptori.mapper.AddressMapper;
import com.doptori.mapper.FarmDiaryManageMapper;

@Controller
public class FarmDiaryMangeController {

	@Autowired
	private FarmDiaryManageMapper mapper;
	@Autowired
	private AddressMapper mapper2;
	
	@RequestMapping("/FarmDiaryManage.do")
	public String FarmDiaryManageInsert(farmdiary_manage vo) {
		mapper.FarmDiaryManageInsert(vo);
		return "redirect:/FarmDiaryManageList2.do";
	}
	
	@RequestMapping("/FarmDiaryManage2.do")
	public String FarmDiaryManageInsert2(farmdiary_manage vo) {
		mapper.FarmDiaryManageInsert2(vo);
		return "redirect:/FarmDiaryManageList2.do";
	}
	
	@RequestMapping("/FarmDiaryManageList2.do")
	public String FarmDiaryManageList2(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		 Member loginMember = (Member) session.getAttribute("loginMember");
		List<farmdiary_manage> list = mapper.FarmDiaryManageList(loginMember.getMb_num());
		List<farmdiary_manage> list2 = mapper.FarmDiaryManageList2(loginMember.getMb_num());
		List<Address> gugunmodelList = mapper2.gugunmodelList();
		List<Address> dongmodelList = mapper2.dongmodelList();
		model.addAttribute("dongmodelList", dongmodelList);
		model.addAttribute("gugunmodelList", gugunmodelList);
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		return "farm_management";
	}
	
}
