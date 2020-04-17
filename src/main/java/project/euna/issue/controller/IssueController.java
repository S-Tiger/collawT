package project.euna.issue.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import project.euna.appendix.vo.AppendixVO;
import project.euna.issue.vo.Criteria;
import project.euna.issue.vo.IssueVO;

public interface IssueController {

	public ModelAndView searchList(Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String issueInsert(IssueVO issueVO, HttpSession session) throws Exception;
	public ModelAndView issueInsert();
	
	public ModelAndView issueRead(String i_Num, HttpServletRequest request, HttpServletResponse response) throws Exception ;
	
	public String issueDelete(IssueVO issueVO) throws Exception;
	
	public String issueUpdate(IssueVO issueVO, Model model) throws Exception;
	public String issueUpdate(IssueVO issueVO, AppendixVO appendixVO, @RequestParam(value="fileNoDel[]") String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception;

	public String imageUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) throws Exception;
}

