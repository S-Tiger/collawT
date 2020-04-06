package project.issue.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import project.issue.vo.IssueVO;

public interface IssueService {

	public void issueInsert(IssueVO issueVO);
	public List<Map> searchList() throws Exception;
	public Map<String, Object> issueRead(String i_Num);	
	public void issueDelete(String i_Num) throws Exception;
	public void issueUpdate(IssueVO issueVO) throws Exception;
}
