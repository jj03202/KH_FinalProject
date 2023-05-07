package org.zerock.myapp.mapper;

import java.util.List;

import org.zerock.myapp.domain.QuestionDTO;

public interface QuestionMapper {

	public void write(QuestionDTO questionDTO); // 1:1문의
	
	public List<QuestionDTO> adminList(); // 1:1 문의 목록 가져오기
	
	public List<QuestionDTO> getListByParam(String memberId);	// 특정 로그인 아이디 값 가져오기
	
	public QuestionDTO getPage(Integer qno);	// 1:1문의 글 조회
	
	public Integer delete(Integer qno);				// 1:1 문의 글 삭제
	
} // end interface
