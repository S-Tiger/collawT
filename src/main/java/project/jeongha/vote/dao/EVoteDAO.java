package project.jeongha.vote.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.jeongha.vote.vo.Criteria;


public interface EVoteDAO {
//
	public int voteInsert(Map map);
	public int votedInsert(Map map);
	public int voterInsert(Map map);
	public List<Map> searchList(Criteria cri) throws DataAccessException;
	public Map<String, Object> voteRead(String v_Num);
	public void voteDelete(String i_Num) throws Exception;
	//public void voteUpdate(IssueVO issueVO) throws Exception;
	public int listCount(String c_Id) throws Exception;
	public List<Map> igRead();
	public List<Map> comemRead(String c_id);
	public void comemInsert(Map<String, Object> dataMap) throws DataAccessException;
	public List<Map> chargerRead(String i_Num);
	public void chargerDelete(String i_Num) throws Exception;
	//public List<Map> coRead(String mem_id);
	//public Map<String, Object> get_i_Num();
	public Map<String, Object> voteInfo(Map<String, Object> voteInfo) throws Exception;
	public List<Map> votedRead(String v_Num) ;
	public List<Map> voteCount(Map<String, Object> voteCount)throws Exception;
	public int checkId(Map<String, Object> mem_Id) throws Exception ;
	
}
