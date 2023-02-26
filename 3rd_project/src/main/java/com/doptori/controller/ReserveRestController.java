package com.doptori.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.doptori.entity.Board;
import com.doptori.entity.Reserve;
import com.doptori.mapper.BoardMapper;
import com.doptori.mapper.ReserveMapper;

@RestController
public class ReserveRestController {
	
	@Autowired
	private ReserveMapper mapper;
	
	@Autowired
	private BoardMapper board_mapper;
	
	@GetMapping("/ConfirmReservation/{re_num}")
	public String ConfirmReservation(@PathVariable int re_num) {
		
		//re_num이 참조하고 있는 원글 찾기
		List<Board> list = mapper.ReservedBoard(re_num);
		//원글에 이미 예약 번호가 있으면 안된다고 리턴
		if(list.size()!=0) {
			return "false";
		}		
		//re_num이 참조하고 있는 원글 찾기
		Reserve reserve = mapper.selectReserve(re_num);
		int orign_num = reserve.getRe_bd_num();
		Board vo = board_mapper.boardContent(orign_num);
		vo.setBd_re_num(re_num);
		System.out.println(vo.getBd_re_num());
		System.out.println(vo.getBd_num());
		mapper.ConfirmReservation(vo);
		

		return "confirm";
	}

}
