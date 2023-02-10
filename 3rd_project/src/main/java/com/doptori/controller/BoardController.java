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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

		
		// 게시판 목록 페이징 처리
		int page,start;
		
		// 한 페이지의 레코드 갯수를 구하여 변수에 저장
		int pcnt;
		if(request.getParameter("pcnt") == null)
		    pcnt = 10;
		else
			pcnt = Integer.parseInt(request.getParameter("pcnt"));
		
		// 원하는 페이지의 시작 인덱스값을 구하기
		if(request.getParameter("page") == null) 
			page = 1;
		else 
			page = Integer.parseInt(request.getParameter("page"));
		
		start = (page-1)*pcnt;
		
		
		// 사용자가 페이지를 이동하기 위해 출력하는 범위
		// pstart, pend
		int pstart,pend;
		
		pstart=page/10; 
		if(page%10 == 0)
			pstart--;
		
		pstart = pstart*10+1;
		pend = pstart+9;
		
		// list를 가져올때 검색필드(sel)와 검색단어(sword)를 같이 전달한다.
		String sel;
		if(request.getParameter("sel")==null)
			sel="bd_title";
		else
			sel=request.getParameter("sel");
						
		String sword;
		if(request.getParameter("sword")==null)
			sword="";
		else
			sword=request.getParameter("sword");

		
		// (전체)총 페이지를 구한 후 view에 전달
		int chong = mapper.getChong(pcnt,sel,sword);
		 
		// (전체)총 페이지보다 pend가 크다면  값을 변경
		if(chong < pend) 
			pend=chong;
		
		
		ArrayList<Board> list2 = mapper.list2(sel,sword,start,pcnt);
		model.addAttribute("list2",list2);
		model.addAttribute("page",page); // 현재 페이지
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong); // 총페이지
		model.addAttribute("pcnt",pcnt);  // 페이지당 레코드 갯수
		model.addAttribute("sel",sel);
		model.addAttribute("sword",sword);

		
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
		return "redirect:/boardContent.do?co_num=" + vo.getCo_bd_num();
	}
	// 댓글 삭제
	@RequestMapping("/commentDelete.do")
	public String commentDelete(@Param(value="co_num") int co_num, @Param(value="co_bd_num") int co_bd_num) {
		mapper.commentDelete(co_num);
		return "redirect:/boardContent.do?co_num="+co_bd_num;
	}
}
