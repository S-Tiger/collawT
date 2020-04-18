package project.euna.issue.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.euna.issue.vo.Criteria;
import project.euna.issue.vo.IssueVO;

public interface IssueDAO {

	public int issueInsert(Map map);
	public List<Map> searchList(Criteria cri) throws DataAccessException;
	public Map<String, Object> issueRead(String i_Num);
	public void issueDelete(String i_Num) throws Exception;
	public void issueUpdate(IssueVO issueVO) throws Exception;
	public int listCount(String c_Id) throws Exception;
	public List<Map> coRead(String mem_id);
	//public Map<String, Object> get_i_Num();

}
