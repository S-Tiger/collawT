package project.issue.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.issue.service.IssueService;
import project.issue.vo.IssueVO;

@Controller

@RequestMapping("/issue/*")
public class issueControllerImpl implements issueController {
	
	
	@Autowired
	IssueService issueService;
	
	//�� ��� ��ȸ
	@GetMapping("/list")
	public ModelAndView searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> searchMap = new HashMap<String, Object>();
		//searchMap.put("p_id", p_id);	 
		
		List<IssueVO> list = issueService.searchList(searchMap);
		
		ModelAndView mav = new ModelAndView("issue/issueList");
		mav.addObject("issueList", list);
		return mav;
		
	}
	
	//�� ���� DB�� �ֱ�
	@PostMapping("/insert")
	public String issueInsert(IssueVO issueVO) throws Exception {
		
		issueService.issueInsert(issueVO);
		
		return "redirect:/issue/list";
	
	}
	
	//�� ���� ȭ��
	@GetMapping("/insert")
	public String issueInsert() {
		return "/issue/issueInsert";
	}
	
	
	//���� �� ��ȸ
	@Override
	@GetMapping("/read")
	public String issueRead(IssueVO issueVO, Model model) throws Exception {
		model.addAttribute("issueRead", issueService.issueRead(issueVO.getI_Num()));
		
		return "/issue/issueRead";
	}
	
	
	//�Խñ� ����
	@Override
	@PostMapping("/delete")
	public String issueDelete(IssueVO issueVO) throws Exception{
	
		issueService.issueDelete(issueVO.getI_Num());
		
		return "redirect:/issue/list";
	}
	
	//�Խñ� ���� �������� �̵�
	@Override
	@GetMapping("/update")
	public String issueUpdate(IssueVO issueVO, Model model) throws Exception {
		model.addAttribute("issueUpdate",issueService.issueRead(issueVO.getI_Num()) );
		return "/issue/issueUpdate";
	}
	
	//�Խñ� ���� db�� �ֱ�
	@Override
	@PostMapping("/update")
	public String issueUpdate(IssueVO issueVO) throws Exception {
		issueService.issueUpdate(issueVO);
		
		return "redirect:/issue/list";
	}


}
