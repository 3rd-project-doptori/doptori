package com.doptori.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import com.doptori.entity.Board;

@Mapper
public interface BoardMapper {

	public List<Board> boardList();

	public void boardInsert(Board vo);

	public Board boardContent(int the_bd_num);

	public void boardUpdate(Board vo);

	public void boardDelete(int bd_num);

	public void boardCount(int bd_num);
	
	@Update("update board set bd_cnt=bd_cnt+1 where bd_num=#{bd_num}")
	public void updateCount(int bd_num);
	
	
}