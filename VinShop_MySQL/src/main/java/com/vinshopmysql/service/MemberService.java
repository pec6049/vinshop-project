package com.vinshopmysql.service;

import com.vinshopmysql.model.MemberVO;

public interface MemberService {

	/* 회원가입 */
	public void memberJoin(MemberVO member) throws Exception;

	/* 아이디 중복 검사 */
	public int idCheck(String memberId) throws Exception;
	
	/* 로그인 */
    public MemberVO memberLogin(MemberVO member) throws Exception;
    
    /* 회원 정보 조회 */
	public MemberVO memberGetDetail(String memberId) throws Exception;

	/* 회원정보 가져오기 */
	public MemberVO importInfo(String memberId) throws Exception;
	
	/* 구매 완료시 session 리셋 */
	public MemberVO reSession(String memberId) throws Exception;
}
