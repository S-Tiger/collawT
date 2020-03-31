package project.issue.dao;

import java.util.List;
import java.util.Map;

import project.issue.vo.IssueVO;

public interface issueDAO {

	public int issueInsert(IssueVO issueVO);
	public List<IssueVO> searchList (Map<String, Object> searchMap);
}
