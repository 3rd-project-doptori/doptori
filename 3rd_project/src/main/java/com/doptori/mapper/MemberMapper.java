package com.doptori.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.doptori.entity.Member;

@Mapper
public interface MemberMapper {

	// 회원가입
	public void MemberInsert(Member vo);
	// 아이디 중복 체크
	public int mbidCheck(String mb_id);
	// 프로필 사진 등록
	public void PhotoUpdate(Member vo);
	// 로그인
	public Member MemberLogin(Member mvo);

	
	//public void updateMember(Member mvo);
	
	// 회원정보수정
	public void userUpdate(Member mvo);

	
	// 회원탈퇴
	public void userDelete(Member mvo);
	// 회원탈퇴 시 비밀번호 확인
	public int passChk(Member vo);

	//관리자 - 회원 목록
	public List<Member> MemberList();
	//관리자 - 회원삭제
	public void MemberDelete(String mb_num);

	
}