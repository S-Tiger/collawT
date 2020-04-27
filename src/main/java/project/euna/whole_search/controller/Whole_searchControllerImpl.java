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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.euna.issue.service.IssueServiceImpl;
import project.euna.issue.vo.IssueVO;
import project.euna.whole_search.service.Whole_searchService;
import project.euna.whole_search.vo.SearchVO;
import project.jeongha.member.vo.MemberVO;


@Controller

@RequestMapping("/search/*")
public class Whole_searchControllerImpl implements Whole_searchController {
	
	//
	@Inject
	Whole_searchService whole_searchService;
	
	@Inject
	IssueServiceImpl issueService;
	
	
	//검색 페이지로 이동
	@Override
	@GetMapping("/main")
	public String issueMain(HttpSession session) {
		
		Map<String, Object> member = new HashMap<String,Object>();
		member = (Map<String, Object>) session.getAttribute("member");
		String mem_Id = (String) member.get("mem_Id");

		
		return "wholesearch/searchMain";
		
	}
	
	//이슈 목록 조회 페이징
	@Override
	@GetMapping("/result")
	public ModelAndView issueResult(
			@RequestParam(required=false,  defaultValue = "i_Name") String searchType,
			@RequestParam(required=false) String keyword,
			SearchVO searchVO, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> member = new HashMap<String,Object>();
		member = (Map<String, Object>) session.getAttribute("member");
		String mem_Id = (String) member.get("mem_Id");
		
		searchVO.setSearchType(searchType);
		searchVO.setKeyword(keyword);
		searchVO.setMem_Id(mem_Id);
		
		List<Map> issueList = whole_searchService.searchIssue(searchVO);
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+issueList);
	
		ModelAndView mav = new ModelAndView("wholesearch/searchResult");
		mav.addObject("issueList", issueList);		
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





