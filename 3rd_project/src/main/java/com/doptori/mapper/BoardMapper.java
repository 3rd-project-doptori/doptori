package com.doptori.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.doptori.entity.Board;
import com.doptori.entity.Comment;

@Mapper
public interface BoardMapper {

	// 게시판 목록
	public List<Board> boardList(int bd_mb_num);
	public List<Board> boardList2(int mb_num);
	// 게시판 목록에 (작성자) 회원의 번호가 아닌 닉네임으로 바꾸기(가변배열로 받아 )
	public String memberNum2Name(int mb_num);

	// 게시판 등록
	public void boardInsert(Board vo);

	// 게시글 상세보기
	//public Board boardContent(int the_bd_num);
	public Board boardContent(int bd_num);
	
	// 게시글 수정
	public void boardUpdate(Board vo);
    // 게시글 삭제
	public void boardDelete(int bd_num);
	// 게시글 조회수
	public void boardCount(int bd_num);
	// 게시글 업데이트
	public void boardContentUpdate(Board vo);
	
	@Update("update board set bd_cnt=bd_cnt+1 where bd_num=#{bd_num}")
	public void updateCount(int bd_num);
	
	
	// 답글 (이건 뭐드라?)
	public Board boardReply(int bd_num);
	// 답글 순번
	public void replySeqUpdate(Board parent);
	// 답글 등록
	public void replyInsert(Board vo);
	// 댓글 등록
	public void commentInsert(Comment vo);	
	// 댓글 목록보기
	public List<Comment> commentSelect(int bd_num);
	// 댓글 삭제
	public void commentDelete(int co_num);
	
	// 페이징
	public ArrayList<Board> list2(String sel, String sword, int start, int pcnt);
	public int getChong(int pcnt, String sel, String sword); // (전체) 총합은 숫자 ->int
	
	
	

	



	
	
	
}
