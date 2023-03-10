package com.doptori.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doptori.entity.Crop;
import com.doptori.entity.Farm;
import com.doptori.entity.Member;
import com.doptori.entity.farmdiary;
import com.doptori.mapper.FarmDiaryMapper;
import com.doptori.mapper.FarmMapper;



@Controller
public class FarmController {

	@Autowired
	private FarmMapper mapper;
	@Autowired
	private FarmDiaryMapper mapper2;
	
	@RequestMapping("/FarmList.do")
	public String FarmList(Model model,HttpServletRequest request) {
		 HttpSession session = request.getSession();
		 Member loginMember = (Member) session.getAttribute("loginMember");

		List<Farm> FarmList = mapper.FarmList(loginMember.getMb_num());
		
		
		List<String> CropNames = new ArrayList<>();
		for (Farm farm : FarmList) {
			CropNames.add(mapper.CropNum2Name(farm.getFm_cp_num()));
		}
	
		
		System.out.println("sql까지 성공");
		model.addAttribute("FarmList", FarmList);
		model.addAttribute("CropNames", CropNames);
		
		System.out.println("model까지 성공");
		
		for (Farm farm : FarmList) {
			System.out.println(farm.toString());
		}
		
		for (String string : CropNames) {
			System.out.println(string);
		}
		
		
		
		return "FarmList";
	}
	
	
	@RequestMapping("/FarmList2.do")
	public String FarmList2(Model model,HttpServletRequest request) {
		 HttpSession session = request.getSession();
		 Member loginMember = (Member) session.getAttribute("loginMember");

		List<Farm> FarmList2 = mapper.FarmList2(loginMember.getMb_num());
		
		
		List<String> CropNames = new ArrayList<>();
		for (Farm farm : FarmList2) {
			CropNames.add(mapper.CropNum2Name(farm.getFm_cp_num()));
		}
	
		
		System.out.println("sql까지 성공");
		model.addAttribute("FarmList2", FarmList2);
		model.addAttribute("CropNames", CropNames);
		
		System.out.println("model까지 성공");
		
		for (Farm farm : FarmList2) {
			System.out.println(farm.toString());
		}
		
		for (String string : CropNames) {
			System.out.println(string);
		}
		
		
		
		return "/schedule/FarmList2";
	}
	
	@RequestMapping("/FarmList3.do")
	public String FarmList3(Model model,HttpServletRequest request) {
		 HttpSession session = request.getSession();
		 Member loginMember = (Member) session.getAttribute("loginMember");

		List<Farm> FarmList3 = mapper.FarmList2(loginMember.getMb_num());
		
		
		List<String> CropNames = new ArrayList<>();
		for (Farm farm : FarmList3) {
			CropNames.add(mapper.CropNum2Name(farm.getFm_cp_num()));
		}
	
		
		System.out.println("sql까지 성공");
		model.addAttribute("FarmList3", FarmList3);
		model.addAttribute("CropNames", CropNames);
		
		System.out.println("model까지 성공");
		
		for (Farm farm : FarmList3) {
			System.out.println(farm.toString());
		}
		
		for (String string : CropNames) {
			System.out.println(string);
		}
		
		
		
		return "/schedule/calendar";
	}
	
	
	@RequestMapping("/MakeFarm.do")
	public void MakeFarm() {}

}
