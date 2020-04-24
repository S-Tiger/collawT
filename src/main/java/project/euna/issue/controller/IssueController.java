package project.euna.issue.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import project.euna.appendix.vo.AppendixVO;
import project.euna.issue.vo.Criteria;
import project.euna.issue.vo.IssueVO;

public interface IssueController {
//
	public ModelAndView searchList(Criteria cri, String c_Id, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String issueInsert(IssueVO issueVO, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView issueInsert(String c_Id, HttpSession session);
	
	public ModelAndView issueRead(String i_Num, HttpServletRequest request, HttpServletResponse response) throws Exception ;
	
	public String issueDelete(String c_Id, String i_Num, IssueVO issueVO) throws Exception;
	
	public String issueUpdate(String c_Id, String i_Num, IssueVO issueVO, Model model) throws Exception;
	public String issueUpdate(IssueVO issueVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public void communityImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload);
	public String issueCopy(IssueVO issueVO, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception;
}

