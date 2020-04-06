package project.issue.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import project.issue.vo.IssueVO;

public interface IssueController {

	public ModelAndView searchList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public String issueInsert(IssueVO issueVO, HttpSession session) throws Exception;
	public String issueInsert();
	
	public ModelAndView issueRead(String i_Num, HttpServletRequest request, HttpServletResponse response);
	
	public String issueDelete(IssueVO issueVO) throws Exception;
	
	public String issueUpdate(IssueVO issueVO, Model model) throws Exception;
	public String issueUpdate(IssueVO issueVO) throws Exception;

}

