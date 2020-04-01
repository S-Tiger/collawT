package project.member.dao;

import project.member.vo.MemberVO;

public interface MemberDao {
	
	public int memberInsert(MemberVO memberVO);
	public MemberVO memberSelect(MemberVO memberVO);
}