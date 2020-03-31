package project.sample.dao;

import project.sample.vo.MemberVO;

public interface MemberDao {
	
	public int memberInsert(MemberVO memberVO);
	public MemberVO memberSelect(MemberVO memberVO);
}