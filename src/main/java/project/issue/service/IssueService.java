package project.issue.service;

import java.util.List;
import java.util.Map;

import project.issue.vo.IssueVO;

public interface IssueService {

	public void issueInsert(IssueVO issueVO);
	public List<IssueVO> searchList (Map<String, Object> searchMap);
}
