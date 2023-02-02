package com.doptori.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doptori.entity.Farm;
import com.doptori.mapper.FarmMapper;



@Controller
public class FarmController {

	@Autowired
	private FarmMapper mapper;
	
	@RequestMapping("/FarmList.do")
	public String FarmList(Model model) {
		
		List<Farm> FarmList = mapper.FarmList();
		
		model.addAttribute("FarmList", FarmList);
		
		return "FarmList";
	}
	
	@RequestMapping("/MakeFarm.do")
	public void MakeFarm() {}
	
	
	
	
	
}
