package project.issue.service;

import java.util.List;
import java.util.Map;

import project.issue.vo.IssueVO;

public interface IssueService {

	public void issueInsert(IssueVO issueVO);
	public List<IssueVO> searchList (Map<String, Object> searchMap);
	public IssueVO issueRead(String i_Num);	
	public void issueDelete(String i_Num) throws Exception;
	public void issueUpdate(IssueVO issueVO) throws Exception;
}
