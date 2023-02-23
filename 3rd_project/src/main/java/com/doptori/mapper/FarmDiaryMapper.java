package com.doptori.mapper;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

import com.doptori.entity.DateData2;
import com.doptori.entity.farmdiary;

@Service
public interface FarmDiaryMapper {
	public int schedule_add(farmdiary farmdiary);
	public int before_schedule_add_search(farmdiary farmdiary);
	public ArrayList<farmdiary> schedule_list(DateData2 dateData);
	
	/* 수정, 삭제를 위한 리스트 불러오기 */
	/* 조회하기 */
	public farmdiary get(int idx);
	
	/* 수정하기 */
	public int update(farmdiary farmdiary);
	
	/* 삭제하기 */
	public int delete(farmdiary farmdiary);
	
	public void farmdiaryInsert(farmdiary vo);
	
	public ArrayList<farmdiary> schedule_list2(DateData2 dateData);
	
	public List<farmdiary> FarmDiaryList(int mb_num);
	
	public void FarmDiaryUpdate(farmdiary vo);
	
	
	public void farmdiarylistdelete(int fd_num);
	
	
}