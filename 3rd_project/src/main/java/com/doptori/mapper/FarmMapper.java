package com.doptori.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.doptori.entity.Crop;
import com.doptori.entity.Farm;

@Mapper
public interface FarmMapper {

	public List<Farm> AllFarmList();
	public List<Farm> FarmList(int fm_mb_num);
	public List<Farm> FarmList2(int fm_mb_num);

	public String CropNum2Name(int cp_num);


}
