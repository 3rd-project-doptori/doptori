package com.doptori.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DoptoriController {
	
	//@Autowired
	//private DoptoriMapper mapper;
	
	@GetMapping("/Main.do")
	public String Main() {
		
		return "Basic";
	}
	
	

}
