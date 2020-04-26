package project.euna.personal_search.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import project.euna.personal_search.vo.Criteria;



public interface Personal_searchController {
	public ModelAndView myBoardlist(Criteria cri, String mem_Id, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception;

}

