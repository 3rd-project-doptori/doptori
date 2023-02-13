package com.doptori.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.doptori.entity.Comment;

@Mapper
public interface CommentMapper {

	public void commentInsert(Comment cvo);

	public Comment commentList(int bd_num);

	public void commentDelete(int co_num);

	

}
