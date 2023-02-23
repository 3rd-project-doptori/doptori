package com.doptori.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.doptori.entity.Board;
import com.doptori.entity.Reserve;

@Mapper
public interface ReserveMapper {
	
	public List<Reserve> ReserveList(int re_mb_nums);
	
	public List<Reserve> ReserveList4buyer(int re_mb_numb);
	
	
	public void ConfirmReservation(Board vo);
	
	public List<Board> ReservedBoard(int bd_re_num);
	
	public Reserve selectReserve(int re_num);

}
