package project.jeongha.member.dao;

import java.util.Map;

import project.jeongha.member.vo.MemberVO;

public interface MemberDao {
	
	public MemberVO login(String mem_id) throws Exception;
	
	public int memberJoin(Map<String,Object> memberVO);
	public Map<String, Object> memberLogin(Map<String, Object> memLogin);
	public int memberUpdate(MemberVO memberVO);
	public int check_id(String mem_id) throws Exception;
	public int update_pw(MemberVO memberVO) throws Exception;
	public int delete_Member(MemberVO memberVO) throws Exception;
	public void saveImage(Map<String, Object> hmap) throws Exception;
	public Map<String, Object> getByteImage(String mem_Id) ;
}