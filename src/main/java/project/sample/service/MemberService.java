package project.sample.service;

import project.sample.vo.MemberVO;

public interface MemberService {
	
	public void memberRegister(MemberVO memberVO);
	public void memberSearch(MemberVO memberVO);
}
