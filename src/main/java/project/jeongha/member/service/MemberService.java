package project.jeongha.member.service;

import javax.servlet.http.HttpServletResponse;

import project.jeongha.member.vo.MemberVO;

public interface MemberService {
	
	public int memberJoin(MemberVO memberVO,HttpServletResponse response)throws Exception;
	public void memberSearch(MemberVO memberVO);
	public MemberVO login(MemberVO memberVO)throws Exception;
	public int memberUpdate(MemberVO memberVO);
	public MemberVO updateMypage(MemberVO memberVO)throws Exception;
	public MemberVO update_pw(MemberVO memberVO, String old_pw, HttpServletResponse response) throws Exception;
	public int check_id(String mem_id) throws Exception ;
	public String create_key() throws Exception ;
	public void sendEmail(MemberVO memberVO, String div) throws Exception;
	public void find_pw(HttpServletResponse response, MemberVO member) throws Exception ;

}
