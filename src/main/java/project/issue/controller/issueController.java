package project.issue.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.issue.vo.IssueVO;

public interface issueController {

	public ModelAndView searchList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public String issueInsert(IssueVO issueVO) throws Exception;
	public String issueInsert();
	
	public String issueRead(IssueVO issueVO, Model model) throws Exception;
	
	public String issueDelete(IssueVO issueVO) throws Exception;
	
	public String issueUpdate(IssueVO issueVO, Model model) throws Exception;
	public String issueUpdate(IssueVO issueVO) throws Exception;

}

