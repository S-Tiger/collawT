package project.euna.whole_search.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.euna.issue.vo.IssueVO;
import project.euna.personal_search.vo.Criteria;
import project.euna.whole_search.vo.SearchVO;
import project.jeongha.member.vo.MemberVO;



public interface Whole_searchController {
	public String issueMain(HttpSession session);
	public ModelAndView issueResult(
			@RequestParam(required=false,  defaultValue = "i_Name") String searchType,
			@RequestParam(required=false) String keyword,
			SearchVO searchVO, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception;
		
}

