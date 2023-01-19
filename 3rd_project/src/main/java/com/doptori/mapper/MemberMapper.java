package com.doptori.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.doptori.entity.Member;

@Mapper
public interface MemberMapper {

	public void MemberInsert(Member vo);

	public void PhotoUpdate(Member vo);

	public Member MemberLogin(Member mvo);
	
}