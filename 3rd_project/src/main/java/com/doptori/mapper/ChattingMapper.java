package com.doptori.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.doptori.entity.Chatroom;

@Mapper
public interface ChattingMapper {
	
	public Chatroom selectChatroom(int cr_num);
	
}
