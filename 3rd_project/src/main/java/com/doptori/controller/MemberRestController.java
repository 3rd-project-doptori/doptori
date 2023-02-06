package com.doptori.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.doptori.entity.Member;
import com.doptori.mapper.MemberMapper;

@RestController
public class MemberRestController {

	@Autowired
	private MemberMapper mapper;
	
	
	@PostMapping("/member")
	public void MemberInsert(Member vo) {
		mapper.MemberInsert(vo);
	}
	

	@PutMapping("/member")
	public void boardAjaxUpdate(@RequestBody Member vo) {
		// 전에는 title, content, writer 등등 여러개 수정하는 메소드를 만듦
		// 이제는 content만 바꾸는 메소드를 새로 만들어야함
		mapper.PhotoUpdate(vo);
	}
	
	@ResponseBody
	@PostMapping("/passChk")
	public int passChk(Member vo) {
		int result = mapper.passChk(vo);
		return result;
	}
	
	@RequestMapping("/MemberList.do")
	public List<Member> MemberList(){
		List<Member> list = mapper.MemberList();
		return list;
	}
	
	@RequestMapping("/MemberDelete.do")
	public List<Member> MemberDelete(String	mb_id) {
		mapper.MemberDelete(mb_id);
		List<Member> list = mapper.MemberList();
		return list;
	}
	
}
