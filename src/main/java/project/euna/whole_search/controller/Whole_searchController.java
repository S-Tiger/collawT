package project.euna.whole_search.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.euna.whole_search.vo.fileCriteria;
import project.euna.whole_search.vo.issueCriteria;
import project.euna.whole_search.vo.replyCriteria;
import project.euna.whole_search.vo.voteCriteria;




public interface Whole_searchController {
	
	public ModelAndView issueResult(
			@RequestParam(required=false) String keyword,
			@RequestParam(required=false) String c_Id,
			@RequestParam(required=false) String order,
			@RequestParam(required=false) String ig_Num,
			@RequestParam(required=false) String wr_mem_Id,
			issueCriteria issuecri, HttpSession session, HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
	public ModelAndView fileResult(
			@RequestParam(required=false) String keyword,
			fileCriteria filecri, HttpSession session, HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
	public ModelAndView voteResult(
			@RequestParam(required=false) String keyword,
			voteCriteria votecri, HttpSession session, HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
	public ModelAndView replyResult(
			@RequestParam(required=false) String keyword,
			replyCriteria replycri, HttpSession session, HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
	public ModelAndView wholeresult(
			@RequestParam(required=false) String keyword,
			issueCriteria issuecri, voteCriteria votecri,
			fileCriteria filecri, replyCriteria replycri,
			HttpSession session, HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
}

