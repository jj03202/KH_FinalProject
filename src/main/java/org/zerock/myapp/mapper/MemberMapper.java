package org.zerock.myapp.mapper;

import org.zerock.myapp.domain.MemberVO;

public interface MemberMapper {
	
	// 회원가입
//	public void memberJoin(MemberVO memberVO);

	// 로그인
	public MemberVO memberLogin(MemberVO memberVO);
	
	
	// 회원 가입  혁규
	public void memberSignup(MemberVO memberVO);
	
} // end class