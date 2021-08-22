package com.vinshopmysql.mapper;

import com.vinshopmysql.model.MemberVO;

public interface MemberMapper {

	/* 회원가입 */
	public void memberJoin(MemberVO member);
	
	/* 아이디 중복 검사 */
	public int idCheck(String memberId);
	
	/* 로그인 */
    public MemberVO memberLogin(MemberVO member);
    
  	/* 회원 정보 조회 */
  	public MemberVO memberGetDetail(String memberId);
  	
  	/* 회원정보 가져오기 */
 	public MemberVO importInfo(String memberId);
 	
 	/* 구매완료시 session 리셋 */
 	public MemberVO reSession(String memberId);

}
