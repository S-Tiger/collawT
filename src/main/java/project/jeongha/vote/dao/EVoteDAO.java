package project.jeongha.vote.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.jeongha.vote.vo.Criteria;


public interface EVoteDAO {
//
	public int voteInsert(Map map);
	public List<Map> searchList(Criteria cri) throws DataAccessException;
	public Map<String, Object> issueRead(String i_Num);
	public void issueDelete(String i_Num) throws Exception;
	//public void issueUpdate(IssueVO issueVO) throws Exception;
	public int listCount(String c_Id) throws Exception;
	public List<Map> igRead();
	public List<Map> comemRead(String c_id);
	public void comemInsert(Map<String, Object> dataMap) throws DataAccessException;
	public List<Map> chargerRead(String i_Num);
	public void chargerDelete(String i_Num) throws Exception;
	//public List<Map> coRead(String mem_id);
	//public Map<String, Object> get_i_Num();

}
