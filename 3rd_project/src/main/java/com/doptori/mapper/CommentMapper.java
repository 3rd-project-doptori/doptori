package com.doptori.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.doptori.entity.Comment;

@Mapper
public interface CommentMapper {
	
	// 댓글 개수
	public int commentCount();

	// 댓글 목록
	public List<Comment> commentList();

	// 댓글 등록
	public int commentInsert(Comment cvo);

	// 댓글 수정
	public int commentUpdate(Comment comment);

	// 댓글 삭제
	public int commentDelete(int co_num);

}

	/*
	 * public void commentInsert(Comment cvo);
	 * 
	 * public Comment commentList(int bd_num);
	 * 
	 * public void commentDelete(int co_num);
	 * 
	 */


