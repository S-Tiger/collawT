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
import project.euna.whole_search.service.Whole_searchService;
import project.euna.whole_search.vo.Criteria;
import project.euna.whole_search.vo.PageMaker;



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
	@GetMapping("/issueresult")
	public ModelAndView issueResult(
			@RequestParam(required=false,  defaultValue = "i_Name") String searchType,
			@RequestParam(required=false) String keyword,
			Criteria cri, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> member = new HashMap<String,Object>();
		member = (Map<String, Object>) session.getAttribute("member");
		String mem_Id = (String) member.get("mem_Id");
		
		
		cri.setKeyword(keyword);
		cri.setMem_Id(mem_Id);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(whole_searchService.issueCount(cri));
		
		List<Map> issueList = whole_searchService.searchIssue(cri);
		
		int issueCount = whole_searchService.issueCount(cri);
	
		ModelAndView mav = new ModelAndView("wholesearch/searchResult");
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("issueList", issueList);
		mav.addObject("issueCount", issueCount);
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





