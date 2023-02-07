package com.doptori.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.doptori.entity.Diary;

@Mapper
public interface DiaryMapper {

	List<Diary> DiaryList(int arg0, int arg1);

	
}
