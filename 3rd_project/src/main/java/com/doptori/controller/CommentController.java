package com.doptori.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.doptori.entity.Comment;
import com.doptori.mapper.CommentMapper;

@Controller
public class CommentController {

	@Autowired
	private CommentMapper cmapper;
	
	/*
	 * @PostMapping("/commentInsert.do") public String
	 * commentInsert(@RequestParam("bd_num")int bd_num, Comment cvo) {
	 * cmapper.commentInsert(cvo); return"redirect:/boardContent.do?bd_num=" +
	 * bd_num; }
	 * 
	 * @PostMapping("/commentDelete.do") public String
	 * commentDelete(@RequestParam("bd_num")int bd_num, int co_num) {
	 * cmapper.commentDelete(co_num); return"redirect:/boardContent.do?bd_num=" +
	 * bd_num; }
	 */
	
}
