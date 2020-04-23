package project.jeongha.vote.controller;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import project.jeongha.vote.vo.Criteria;
import project.jeongha.vote.vo.VoteVO;



public interface EVoteController {
//
	public ModelAndView searchList(Criteria cri, String c_Id, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String issueInsert(VoteVO voteVO, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView voteInsert(String c_Id, HttpSession session);
	
	//public ModelAndView issueRead(String i_Num, HttpServletRequest request, HttpServletResponse response) throws Exception ;
	
	//public String issueDelete(String c_Id, String i_Num, IssueVO issueVO) throws Exception;
	
	//public String issueUpdate(String c_Id, String i_Num, IssueVO issueVO, Model model) throws Exception;
	//public String issueUpdate(IssueVO issueVO, HttpServletRequest request, HttpServletResponse response) throws Exception;

	
}

