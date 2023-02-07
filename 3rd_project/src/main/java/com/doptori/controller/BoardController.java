package com.doptori.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doptori.entity.Board;
import com.doptori.entity.Member;
import com.doptori.mapper.BoardMapper;

@Controller
public class BoardController {
	
	@Autowired
	private BoardMapper mapper;
	
	//@RequestMapping("/boardListFrom.do")
	//public void boardListFrom() {}
	
	@RequestMapping("/boardList.do")
	public String boardList(Model model,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		
		List<Board> list = mapper.boardList(loginMember.getMb_num());
		
		
		List<String> memberNames = new ArrayList<>();
		for (Board board : list) {
			memberNames.add(mapper.memberNum2Name(board.getBd_mb_num()));
		}
		model.addAttribute("list",list);
		model.addAttribute("memberNames", memberNames);
		
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

		/*
		 * HttpSession session = request.getSession(); Member loginMember = (Member)
		 * session.getAttribute("loginMember");
		 * 
		 * Board board = mapper.boardContent(loginMember.getMb_num());
		 * 
		 * Board memberName = new Board();
		 * memberName.add(mapper.memberNum2Name(board.getBd_mb_num()));
		 * 
		 * model.addAttribute("board", board); model.addAttribute("memberName", memberName);
		 */
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
