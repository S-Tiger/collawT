package project.jeongha.vote.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import project.jeongha.vote.vo.Criteria;


public interface EVoteService {
//
	public void  voteInsert(Map map);
	public List<Map> searchList(Criteria cri) throws Exception;
	public Map<String, Object> issueRead(String i_Num);	
	public void issueDelete(String i_Num) throws Exception;
	//public void issueUpdate(IssueVO issueVO) throws Exception;
	public int listCount(String c_Id) throws Exception;
	public List<Map> igRead();
	public List<Map> comemRead(String c_id);
	public void comemInsert(Map<String, Object> dataMap) throws Exception;
	public List<Map> chargerRead(String i_Num);
	public void chargerDelete(String i_Num) throws Exception;
	//public List<Map> coRead(String mem_id);

}
