package project.euna.issue.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import project.euna.issue.vo.Criteria;
import project.euna.issue.vo.IssueVO;

public interface IssueService {

	public void issueInsert(IssueVO issueVO);
	public List<Map> searchList(Criteria cri) throws Exception;
	public Map<String, Object> issueRead(String i_Num);	
	public void issueDelete(String i_Num) throws Exception;
	public void issueUpdate(IssueVO issueVO) throws Exception;
	public int listCount() throws Exception;

}
