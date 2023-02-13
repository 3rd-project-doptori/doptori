package com.doptori.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.doptori.mapper.FarmMapper;

@Controller
public class AnalysisController {
	
	@Autowired
	private FarmMapper mapper;
}
