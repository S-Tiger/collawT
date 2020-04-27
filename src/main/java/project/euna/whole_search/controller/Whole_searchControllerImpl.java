package project.euna.whole_search.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import project.euna.whole_search.service.Whole_searchService;
import project.euna.whole_search.vo.Criteria;
import project.euna.whole_search.vo.PageMaker;


@Controller

@RequestMapping("/search/*")
public class Whole_searchControllerImpl implements Whole_searchController {
	
	//
	@Inject
	Whole_searchService whole_searchService;

	
	//글 목록 조회 페이징
	@Override
	@GetMapping("/issueSearch")
	public ModelAndView issueSearch(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> member = new HashMap<String,Object>();
		member = (Map<String, Object>) session.getAttribute("member");
		String mem_Id = (String) member.get("mem_Id");
		
				
		List<Map> list = whole_searchService.search(mem_Id);
		
		ModelAndView mav = new ModelAndView("wholesearch/search");
		mav.addObject("issueSearch", list);		
		
		return mav;
		
	}

	


	//파일함
//	@Override
//	@GetMapping("/myFile")
//	public ModelAndView myFile(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		
//		Map<String, Object> member = new HashMap<String,Object>();
//		member = (Map<String, Object>) session.getAttribute("member");
//		String mem_Id = (String) member.get("mem_Id");
//				
//		List<Map> list = personal_searchService.myFile(mem_Id);
//		
//		
//		ModelAndView mav = new ModelAndView("/personal/myFile");
//		mav.addObject("myFile", list);
//		
//		return mav;
//		
//	}
//

}





