package com.doptori.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doptori.entity.Board;
import com.doptori.mapper.BoardMapper;

@Controller
public class BoardController {
	
	@Autowired(required=true)
	private BoardMapper mapper;
	
	//@RequestMapping("/boardListFrom.do")
	//public void boardListFrom() {}
	
	@RequestMapping("/boardList.do")
	public String boardList(Model model) {
		
		List<Board> list = mapper.boardList();
		model.addAttribute("list",list);
		
		return "boardList";
	}
	
	@RequestMapping("/boardInsertForm.do")
	public void boardInsertForm() {}
	
	@RequestMapping("/boardInsert.do")
	public String boardInsert(Board vo) {
		mapper.boardInsert(vo);
		
		return "redirect:/boardList.do";
	}
	
	
	@RequestMapping("/boardContent.do/{bd_num}")
	public String boardContent(@PathVariable("bd_num")int the_bd_num, Model model) {
		
		Board vo = mapper.boardContent(the_bd_num);
		mapper.boardCount(the_bd_num);
		model.addAttribute("vo", vo);

		return "boardContent";
	}

	@RequestMapping("/boardUpdateForm.do")
	public String boardUpdateForm(int bd_num, Model model) {
		Board vo = mapper.boardContent(bd_num);
		
		model.addAttribute("vo", vo);

		return "boardUpdateForm";
	}
	@PostMapping("/boardUpdate.do")
	public String boardUpdate(Board vo) {
		
		mapper.boardUpdate(vo);
		
		return "redirect:/boardList.do";
	}
	
	@RequestMapping("/boardDelete.do/{bd_num}")
	public String boardDelete(@PathVariable("bd_num")int bd_num, Model model) {
		
		mapper.boardDelete(bd_num);
		
		return "redirect:/boardList.do";
	}
	
	@GetMapping("/updateCount/{bd_num}")
	public Board updateCount(@PathVariable int bd_num) {
		
		mapper.updateCount(bd_num);
		
		Board vo = mapper.boardContent(bd_num);
		return vo;
	}
	
}
