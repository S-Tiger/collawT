package project.issue.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.issue.vo.IssueVO;

public interface issueDAO {

	public int issueInsert(IssueVO issueVO);
	public List<Map> searchList() throws DataAccessException;
	public List<Map> issueRead(String i_Num);
	public void issueDelete(String i_Num) throws Exception;
	public void issueUpdate(IssueVO issueVO) throws Exception;
}
