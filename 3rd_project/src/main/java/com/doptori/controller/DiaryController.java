package com.doptori.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.doptori.entity.Diary;
import com.doptori.entity.Member;
import com.doptori.mapper.DiaryMapper;

@RestController
public class DiaryController {

	@Autowired
	private DiaryMapper mapper;
	
	@GetMapping("/DiaryList.do/{fm_num}")
	public List<Diary> DiaryList(HttpServletRequest request, @PathVariable("fm_num")int fm_num) {
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		System.out.println(loginMember.getMb_num());
		System.out.println(fm_num);
		List<Diary> DiaryList = mapper.DiaryList(loginMember.getMb_num(), fm_num);
		System.out.println("t");
		for (Diary diary : DiaryList) {
			System.out.println(diary.toString());
		}
		return DiaryList;
	}
	
}
