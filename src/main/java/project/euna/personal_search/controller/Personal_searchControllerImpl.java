package project.euna.personal_search.controller;

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


import project.euna.personal_search.service.Personal_searchService;
import project.euna.personal_search.vo.Criteria;
import project.euna.personal_search.vo.PageMaker;

@Controller

@RequestMapping("/personal/search/*")
public class Personal_searchControllerImpl implements Personal_searchController {
	
	//
	@Inject
	Personal_searchService personal_searchService;

	
	//글 목록 조회 페이징
	@Override
	@GetMapping("/myBoardlist")
	public ModelAndView myBoardlist(Criteria cri, String mem_Id, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
//		Map<String, Object> member = new HashMap<String,Object>();
//		member = (Map<String, Object>) session.getAttribute("member");
//		mem_Id = (String) member.get("mem_Id");
				
		List<Map> list = personal_searchService.myBoardlist(cri);
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(personal_searchService.myBoardlistCount(mem_Id));
		
	
		ModelAndView mav = new ModelAndView("personal/myBoardlist");
		mav.addObject("myBoardlist", list);
		mav.addObject("pageMaker", pageMaker);		
		
		return mav;
		
	}

	

	//게시글 삭제
//	@Override
//	@GetMapping("/delete")
//	public String issueDelete(String c_Id, String i_Num, IssueVO issueVO) throws Exception{
//		
//		personal_searchService.chargerDelete(issueVO.getI_Num());
//		personal_searchService.issueDelete(issueVO.getI_Num());
//	
//		
//		
//		return "redirect:/project/issue/list?c_Id="+c_Id;
//	}
	



}





