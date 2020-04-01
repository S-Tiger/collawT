package project.issue.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project.issue.service.IssueService;
import project.issue.vo.IssueVO;

@Controller

@RequestMapping("/issue/*")
public class issueController {
	
	@Autowired
	IssueService issueService;
	
	@GetMapping("/list")
	public String searchList(@RequestParam(value="mem_Id", required=false)String mem_Id, Model model) throws Exception {
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("mem_Id", mem_Id);	 
		
		List<IssueVO> list = issueService.searchList(searchMap);
		
		
		
		model.addAttribute("hi",list);
		
		return "/issue/issue";
		
	}
	
	@PostMapping("/add")
	public String searchInsert(IssueVO issueVO) throws Exception {
		
		issueService.issueInsert(issueVO);
		
		return "/issue/issue";
	}

}
