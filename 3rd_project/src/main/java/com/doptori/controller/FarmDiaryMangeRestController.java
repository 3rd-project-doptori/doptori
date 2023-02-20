package com.doptori.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.doptori.mapper.FarmDiaryManageMapper;

@RestController
public class FarmDiaryMangeRestController {

	@Autowired
	private FarmDiaryManageMapper mapper;
	
	
	@DeleteMapping("/farmdiarydelete/{fdm_num}")
	public void farmdiarydelete(@PathVariable int fdm_num) {
		mapper.farmdiarydelete(fdm_num);
	}
	
}
