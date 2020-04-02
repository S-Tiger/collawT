package project.member.service;

import javax.servlet.http.HttpServletResponse;

import project.member.vo.MemberVO;

public interface MemberService {
	
	public void memberJoin(MemberVO memberVO);
	public void memberSearch(MemberVO memberVO);
	public MemberVO login(MemberVO memberVO)throws Exception;
	public int memberUpdate(MemberVO memberVO);
	public MemberVO updateMypage(MemberVO memberVO)throws Exception;
	public MemberVO update_pw(MemberVO member, String old_pw, HttpServletResponse response) throws Exception;
	public void check_id(String mem_id, HttpServletResponse response) throws Exception ;
}
