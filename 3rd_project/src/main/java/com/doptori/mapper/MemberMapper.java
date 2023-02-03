package com.doptori.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.doptori.entity.Member;

@Mapper
public interface MemberMapper {

	public void MemberInsert(Member vo);

	public void PhotoUpdate(Member vo);

	public Member MemberLogin(Member mvo);

	
	public void updateMember(Member mvo);

	public void userUpdate(Member mvo);

	public int mbidCheck(String mb_id);

	public void userDelete(Member mvo);

	
}