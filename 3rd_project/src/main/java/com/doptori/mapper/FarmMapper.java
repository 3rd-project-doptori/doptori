package com.doptori.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.doptori.entity.Farm;

@Mapper
public interface FarmMapper {

	public List<Farm> FarmList();

}
