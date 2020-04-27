package project.euna.whole_search.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import project.euna.personal_search.vo.Criteria;



public interface Whole_searchController {
	public ModelAndView issueSearch( HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception;
}

