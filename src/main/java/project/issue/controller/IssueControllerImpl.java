package project.issue.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.issue.service.IssueService;
import project.issue.vo.IssueVO;

@Controller

@RequestMapping("/issue/*")
public class IssueControllerImpl implements IssueController {
	
	
	@Autowired
	IssueService issueService;
	
	//글 목록 조회
	@Override
	@GetMapping("/list")
	public ModelAndView searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<Map> list = issueService.searchList();
		
		ModelAndView mav = new ModelAndView("issue/issueList");
		mav.addObject("issueList", list);
		return mav;
		
	}

	
	//글 쓰기 DB에 넣기
	@Override
	@PostMapping("/insert")
	public String issueInsert(IssueVO issueVO, HttpSession session) throws Exception {
		issueVO.setMem_Id((String)session.getAttribute("mem_Id"));
		issueService.issueInsert(issueVO);
		
		return "redirect:/issue/list";
	
	}
	
	//글 쓰기 화면
	@Override
	@GetMapping("/insert")
	public String issueInsert() {
		
		return "/issue/issueInsert";
	}
	
	
	//개별 글 조회
	@Override
	@GetMapping("/read")
	public ModelAndView issueRead(String i_Num, HttpServletRequest request, HttpServletResponse response) {
		
		Map<String, Object> searchMap = issueService.issueRead(i_Num);
		
		ModelAndView mav = new ModelAndView("issue/issueRead");
		mav.addObject("issueRead", searchMap);
		
		System.out.println(searchMap);
		System.out.println(searchMap.get("MEM_ID"));
		
		return mav;
	}
	
	
	//게시글 삭제
	@Override
	@PostMapping("/delete")
	public String issueDelete(IssueVO issueVO) throws Exception{
	
		issueService.issueDelete(issueVO.getI_Num());
		
		return "redirect:/issue/list";
	}
	
	//게시글 수정 페이지로 이동
	@Override
	@GetMapping("/update")
	public String issueUpdate(IssueVO issueVO, Model model) throws Exception {
		model.addAttribute("issueUpdate",issueService.issueRead(issueVO.getI_Num()) );
		return "/issue/issueUpdate";
	}
	
	//게시글 수정 db에 넣기
	@Override
	@PostMapping("/update")
	public String issueUpdate(IssueVO issueVO) throws Exception {
		issueService.issueUpdate(issueVO);
		
		String i_Num = issueVO.getI_Num();
		
		//수정한 게시물로 리턴
		return "redirect:/issue/read?i_Num="+i_Num;
	}


}
