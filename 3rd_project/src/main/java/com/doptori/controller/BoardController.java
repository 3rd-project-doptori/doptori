package com.doptori.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doptori.entity.Board;
import com.doptori.entity.Comment;
import com.doptori.entity.Member;
import com.doptori.mapper.BoardMapper;

@Controller
public class BoardController {

	@Autowired
	private BoardMapper mapper;

	// @RequestMapping("/boardListFrom.do")
	// public void boardListFrom() {}

	@RequestMapping("/boardList.do")
	public String boardList(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");

		List<Board> list = mapper.boardList(loginMember.getMb_num());

		List<String> memberNames = new ArrayList<>();
		for (Board board : list) {
			memberNames.add(mapper.memberNum2Name(board.getBd_mb_num()));
		}
		model.addAttribute("list", list);
		model.addAttribute("memberNames", memberNames);

		return "boardList";
	}

	@RequestMapping("/boardInsertForm.do")
	public void boardInsertForm() {
	}

	@RequestMapping("/boardInsert.do")
	public String boardInsert(Board vo) {
		mapper.boardInsert(vo);

		return "redirect:/boardList.do";
	}

	/*
	 * @RequestMapping("/boardContent.do/{bd_num}") 
	 * public String boardContent(@PathVariable("bd_num")int the_bd_num, Model model) {
	 * 
	 * Board vo = mapper.boardContent(the_bd_num); 
	 * mapper.boardCount(the_bd_num);
	 * model.addAttribute("vo", vo);
	 * 
	 * 
	 * HttpSession session = request.getSession(); Member loginMember = (Member)
	 * session.getAttribute("loginMember");
	 * 
	 * Board board = mapper.boardContent(loginMember.getMb_num());
	 * 
	 * Board memberName = new Board();
	 * memberName.add(mapper.memberNum2Name(board.getBd_mb_num()));
	 * 
	 * model.addAttribute("board", board); model.addAttribute("memberName",
	 * memberName);
	 * 
	 * return "boardContent"; }
	 */
	@RequestMapping("/boardContent.do/{bd_num}")
	public String boardContent(@PathVariable("bd_num")int bd_num, Model model) {
		Board vo = mapper.boardContent(bd_num);	
		
		// 조회수 업데이트
		mapper.boardCount(bd_num);
		
		List<Comment> list = mapper.commentSelect(bd_num);
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
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
	public String boardDelete(@PathVariable("bd_num") int bd_num, Model model) {

		mapper.boardDelete(bd_num);

		return "redirect:/boardList.do";
	}

	@GetMapping("/updateCount/{bd_num}")
	public Board updateCount(@PathVariable int bd_num) {

		mapper.updateCount(bd_num);

		Board vo = mapper.boardContent(bd_num);
		return vo;
	}
	
	
	
	@RequestMapping("/boardReplyForm.do") 
	public void boardReplyForm() { }
	
	
	@GetMapping("/boardReply.do")
	public String boardReply(int bd_num, Model model) {
		Board vo = mapper.boardReply(bd_num);
		model.addAttribute("vo", vo);
		
		Board parent = mapper.boardContent(bd_num);
		model.addAttribute("parent", parent);
		
		return "/boardReply";
	}
	@PostMapping("/boardReply.do")
	public String boardReply(Board vo) {
		// 부모글 정보 가져오기
		Board parent = mapper.boardContent(vo.getBd_num());
		// 답글의 bd_group 설정
		vo.setBd_group(parent.getBd_group());
		// 답글의 bd_seq를 부모글의 bd_seq+1
		vo.setBd_seq(parent.getBd_seq());
		// 답글의 bd_level을 부모글의 bd_level+1
		vo.setBd_level(parent.getBd_level()+1);
		// 답글을 저장하기 전에 답글의 순서 저정 (bd_seq +1)
		mapper.replySeqUpdate(parent);
		// 답글 저장
		mapper.replyInsert(vo);
		
		return "redirect:/boardList.do";
	}
	
	// 댓글 입력
	@RequestMapping("/commentInsert.do")
	public String commentInsert(Comment vo) {
		mapper.commentInsert(vo);
		return "redirect:/boardContent.do?bd_num=" + vo.getCo_bd_num();
	}
	// 댓글 삭제
	@RequestMapping("/commentDelete.do")
	public String commentDelete(@Param(value="co_num") int co_num, @Param(value="co_bd_num") int co_bd_num) {
		mapper.commentDelete(co_num);
		return "redirect:/boardContent.do?co_num="+co_bd_num;
	}
}
