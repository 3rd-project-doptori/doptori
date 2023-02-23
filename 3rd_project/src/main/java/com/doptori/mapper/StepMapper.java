package com.doptori.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.doptori.entity.Step;

@Mapper
public interface StepMapper {

	public List<Step> stepList();


	
}
