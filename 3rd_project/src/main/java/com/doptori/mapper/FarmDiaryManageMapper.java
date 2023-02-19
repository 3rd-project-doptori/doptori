package com.doptori.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.doptori.entity.farmdiary_manage;


@Mapper
public interface FarmDiaryManageMapper {

	void FarmDiaryManageInsert(farmdiary_manage vo);

	void FarmDiaryManageInsert2(farmdiary_manage vo);
	
	
	
	
	
	void AnalysisInsert(String pic, int mb_num);

	List<farmdiary_manage> FarmDiaryManageList(int mb_num);

	List<farmdiary_manage> FarmDiaryManageList2(int mb_num);



}
