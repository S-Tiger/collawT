package project.member.service;

import project.member.vo.MemberVO;

public interface MemberService {
	
	public void memberRegister(MemberVO memberVO);
	public void memberSearch(MemberVO memberVO);
	public MemberVO login(MemberVO memberVO)throws Exception;
	public void memberUpdate(MemberVO memberVO);
}
