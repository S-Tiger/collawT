package project.jeongha.member.service;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import project.jeongha.member.vo.MemberVO;

public interface MemberService {
	
	public int memberJoin(Map<String,Object> member,MemberVO memberVO,HttpServletResponse response)throws Exception;
	public void memberSearch(MemberVO memberVO);
	public Map<String, Object> login(Map<String, Object> memLogin)throws Exception;
	public int memberUpdate(MemberVO memberVO);
	public MemberVO updateMypage(MemberVO memberVO)throws Exception;
	public MemberVO update_pw(MemberVO memberVO, String old_pw, HttpServletResponse response) throws Exception;
	public int check_id(String mem_id) throws Exception ;
	public String create_key() throws Exception ;
	public void sendEmail(MemberVO memberVO, String div) throws Exception;
	public void find_pw(HttpServletResponse response, MemberVO memberVO,Map<String,Object> member) throws Exception ;
	public MemberVO delete_Member(MemberVO memberVO, String pwd, HttpServletResponse response) throws Exception ;
}
