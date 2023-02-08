package com.doptori.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DoptoriController {
	
	//@Autowired
	//private DoptoriMapper mapper;
	
	@GetMapping("/Main.do")
	public String Main() {
		
		return "main";
	}
	
	@GetMapping("/signin.do")
	public String signin() {
		return "signin";
	}
	
	@GetMapping("/signup.do")
	public String signup() {
		return "signup";
	}

}
