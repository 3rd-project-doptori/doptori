package com.doptori.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.doptori.entity.farmdiary_manage;


@Mapper
public interface FarmDiaryManageMapper {

	void FarmDiaryManageInsert(farmdiary_manage vo);

	void FarmDiaryManageInsert2(farmdiary_manage vo);
	
	void FarmDiaryManageInsert3(farmdiary_manage vo);
	
	void FarmDiaryManageInsert4(farmdiary_manage mvo);
	
	void FarmDiaryManageInsert5(farmdiary_manage vo);
	
	void FarmDiaryManageInsert6(farmdiary_manage vo);
	
	void AnalysisInsert(String pic, int mb_num);

	List<farmdiary_manage> FarmDiaryManageList(int mb_num);

	List<farmdiary_manage> FarmDiaryManageList2(int mb_num);
	
	List<farmdiary_manage> FarmDiaryManageList3(int mb_num);
	
	List<farmdiary_manage> FarmDiaryManageList4(int mb_num);
	
	List<farmdiary_manage> FarmDiaryManageList5(int mb_num);
	
	List<farmdiary_manage> FarmDiaryManageList6(int mb_num);

	List<farmdiary_manage> FarmDiaryManageList7(int mb_num);
	
	void farmdiarydelete(int fdm_num);

	void FarmDiaryManageUpdate(farmdiary_manage vo);

	void FarmDiaryManageUpdate2(farmdiary_manage vo);

	void FarmDiaryManageUpdate4(farmdiary_manage vo);

	void FarmDiaryManageUpdate3(farmdiary_manage vo);
	
	void FarmDiaryManageUpdate5(farmdiary_manage vo);
	
	void FarmDiaryManageUpdate6(farmdiary_manage vo);



	
}
