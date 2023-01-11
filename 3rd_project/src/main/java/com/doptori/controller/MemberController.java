package com.doptori.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.doptori.entity.Member;
import com.doptori.mapper.MemberMapper;


@RestController
public class MemberController {

	@Autowired
	private MemberMapper mapper;
	
	
	@PostMapping("/member")
	public void MemberInsert(Member vo) {
		mapper.MemberInsert(vo);
	}
	
}
