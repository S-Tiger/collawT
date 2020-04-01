package project.issue.controller;

import project.issue.vo.IssueVO;

public interface issueController {

	public String searchList() throws Exception;
	
	public String issueInsert(IssueVO issueVO) throws Exception;
}

