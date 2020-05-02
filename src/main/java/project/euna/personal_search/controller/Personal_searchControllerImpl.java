package project.euna.personal_search.controller;

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
import project.euna.personal_search.service.Personal_searchService;
import project.euna.personal_search.vo.Criteria;
import project.euna.personal_search.vo.PageMaker;
import project.euna.whole_search.service.Whole_searchService;
import project.euna.whole_search.vo.fileCriteria;
import project.euna.whole_search.vo.filePageMaker;

@Controller

@RequestMapping("/personal/search/*")
public class Personal_searchControllerImpl implements Personal_searchController {
	
	//
	@Inject
	Personal_searchService personal_searchService;
	
	@Inject
	Whole_searchService whole_searchService;
	
	@Inject
	IssueServiceImpl issueService;

	
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
	
	//파일함
	@Override
	@GetMapping("/myFile")
	public ModelAndView myFile(
			@RequestParam(required=false) String keyword,
			@RequestParam(required=false) String c_Id,
			@RequestParam(required=false) String order,
			@RequestParam(required=false) String a_NameEx,
			@RequestParam(required=false) String wr_mem_Id,
			fileCriteria filecri, HttpSession session, HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		Map<String, Object> member = new HashMap<String,Object>();
		member = (Map<String, Object>) session.getAttribute("member");
		String mem_Id = (String) member.get("mem_Id");
		
		
		filecri.setKeyword(keyword);
		filecri.setMem_Id(mem_Id);
		
		filePageMaker filepageMaker = new filePageMaker();
		filepageMaker.setCri(filecri);
		filepageMaker.setTotalCount(whole_searchService.fileCount(filecri));
		
		List<Map> fileList = whole_searchService.searchFile(filecri);
		
		int fileCount = whole_searchService.fileCount(filecri);
		
		List<Map> coworkList = issueService.coRead(mem_Id);
		
		List<Map> fileWriter = whole_searchService.fileWriter(filecri);
		
		List<Map> fileEx = whole_searchService.fileEx(filecri);
	
		ModelAndView mav = new ModelAndView("personal/myFile");
		mav.addObject("filepageMaker", filepageMaker);
		mav.addObject("fileList", fileList);
		mav.addObject("fileCount", fileCount);
		mav.addObject("coworkList", coworkList);
		mav.addObject("fileWriter", fileWriter);
		mav.addObject("fileEx", fileEx);
		mav.addObject("keyword", keyword);
		mav.addObject("c_Id", c_Id);
		mav.addObject("order", order);
		mav.addObject("wr_mem_Id", wr_mem_Id);
		mav.addObject("a_NameEx", a_NameEx);
		return mav;
		
	}


}





