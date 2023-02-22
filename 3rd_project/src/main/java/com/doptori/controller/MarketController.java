package com.doptori.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doptori.mapper.MarketMapper;

@Controller
public class MarketController {
	
	@Autowired
	private MarketMapper mapper;
	
	@RequestMapping("/marketInsertForm.do")
	public String marketInsertForm() {
		return "marketInsertForm";
	}
	
	
	
}
