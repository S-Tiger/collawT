package project.euna.whole_search.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.euna.whole_search.vo.Criteria;




public interface Whole_searchController {
	public String issueMain(HttpSession session);
	public ModelAndView issueResult(
			@RequestParam(required=false) String keyword,
			Criteria cri, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView fileResult(
			@RequestParam(required=false) String keyword,
			Criteria cri, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView voteResult(
			@RequestParam(required=false) String keyword,
			Criteria cri, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView replyResult(
			@RequestParam(required=false) String keyword,
			Criteria cri, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception;
}

