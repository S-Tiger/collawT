package project.jeongha.vote.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import project.jeongha.vote.vo.Criteria;
import project.jeongha.vote.vo.VoteVO;


public interface EVoteService {
//
	public void  voteInsert(Map map);
	public void  votedInsert(Map map);
	public void  voterInsert(Map map);
	public List<Map> searchList(Criteria cri) throws Exception;
	public Map<String, Object> voteRead(String v_Num);	
	public void voteDelete(String v_Num) throws Exception;
	//public void voteUpdate(VoteVO issueVO) throws Exception;
	public int listCount(String c_Id) throws Exception;
	public List<Map> igRead();
	public List<Map> comemRead(String c_id);
	public void comemInsert(Map<String, Object> dataMap) throws Exception;
	public List<Map> chargerRead(String v_Num);
	public void chargerDelete(String v_Num) throws Exception;
	//public List<Map> coRead(String mem_id);
	public Map<String, Object> voteInfo(Map<String, Object> voteVO)throws Exception;
	public List<Map> votedRead(String v_Num);
}
