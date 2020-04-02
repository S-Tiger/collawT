package project.issue.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.issue.service.IssueService;
import project.issue.vo.IssueVO;

@Controller

@RequestMapping("/issue/*")
public class issueControllerImpl {
	
	
	@Autowired
	IssueService issueService;
	
	@GetMapping("/list")
	public ModelAndView searchList(@RequestParam(value="p_id", required=false) String p_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("p_id", p_id);	 
		
		List<IssueVO> list = issueService.searchList(searchMap);
		
		ModelAndView mav = new ModelAndView("issue/issueList");
		mav.addObject("issueList", list);
		return mav;
		
	}
	
	@PostMapping("/insert")
	public String issueInsert(IssueVO issueVO) throws Exception {
		
		issueService.issueInsert(issueVO);
		
		return "redirect:/issue/list";
	
	}
	
	@GetMapping("/insert")
	public String test() {
		return "/issue/issueInsert";
	}
}
