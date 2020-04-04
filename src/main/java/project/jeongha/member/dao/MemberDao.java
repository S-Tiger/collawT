package project.jeongha.member.dao;

import project.jeongha.member.vo.MemberVO;

public interface MemberDao {
	
	public MemberVO login(String mem_id) throws Exception;
	
	public int memberInsert(MemberVO memberVO);
	public MemberVO memberSelect(MemberVO memberVO);
	public int memberUpdate(MemberVO memberVO);
	public int check_id(String mem_id) throws Exception;
	public int update_pw(MemberVO memberVO) throws Exception;
	public int delete_Member(MemberVO memberVO) throws Exception;

}