package project.euna.issue.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import project.euna.issue.vo.AppendixVO;
import project.euna.issue.vo.Criteria;
import project.euna.issue.vo.IssueVO;

public interface IssueController {

	public ModelAndView searchList(Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String issueInsert(AppendixVO appendixVO, IssueVO issueVO, HttpSession session) throws Exception;
	public String issueInsert();
	
	public ModelAndView issueRead(String i_Num, HttpServletRequest request, HttpServletResponse response) throws Exception ;
	
	public String issueDelete(IssueVO issueVO) throws Exception;
	
	public String issueUpdate(IssueVO issueVO, Model model) throws Exception;
	public String issueUpdate(IssueVO issueVO) throws Exception;
	
	public String saveFile(MultipartHttpServletRequest mtfRequest, AppendixVO appendixVO) throws Exception;
	//public ModelAndView fileList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity<byte[]> download(AppendixVO appendixVO, HttpServletResponse response);
}

