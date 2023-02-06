package com.doptori.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.doptori.entity.Member;

@Mapper
public interface MemberMapper {

	public void MemberInsert(Member vo);

	public void PhotoUpdate(Member vo);

	public Member MemberLogin(Member mvo);

	
	//public void updateMember(Member mvo);

	public void userUpdate(Member mvo);

	public int mbidCheck(String mb_id);

	public void userDelete(Member mvo);

	public int passChk(Member vo);

	//관리자 - 회원 목록
	public List<Member> MemberList();
	//관리자 - 회원삭제
	public void MemberDelete(String id);

	
}