package com.doptori.mapper;


import org.apache.ibatis.annotations.Mapper;

import com.doptori.entity.farmdiary_manage;


@Mapper
public interface FarmDiaryManageMapper {

	void FarmDiaryManageInsert(farmdiary_manage vo);

}
