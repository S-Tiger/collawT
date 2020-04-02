package project.member.dao;

import project.member.vo.MemberVO;

public interface MemberDao {
	
	public MemberVO login(String mem_id) throws Exception;
	
	public int memberInsert(MemberVO memberVO);
	public MemberVO memberSelect(MemberVO memberVO);
	public int memberUpdate(MemberVO memberVO);
	public int check_id(String mem_id) throws Exception;

}