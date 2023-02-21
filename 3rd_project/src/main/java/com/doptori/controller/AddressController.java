package com.doptori.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doptori.entity.Address;
import com.doptori.mapper.AddressMapper;

@Controller
public class AddressController {
	
	@Autowired
	private AddressMapper mapper;
	
	@RequestMapping("/gugunmodelList.do")
	public String gugunmodelList(Model model) {
		List<Address> gugunmodelList = mapper.gugunmodelList();
		model.addAttribute("gugunmodelList", gugunmodelList);
		return "farm_management";
	}
	
	@RequestMapping("/dongmodelList.do")
	public String dongmodelList(Model model) {
		List<Address> dongmodelList = mapper.dongmodelList();
		model.addAttribute("dongmodelList", dongmodelList);
		return "farm_management";
	}
	
}
