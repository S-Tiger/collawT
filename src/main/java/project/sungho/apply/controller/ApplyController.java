package project.sungho.apply.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import project.sungho.apply.vo.ApplyVO;

public interface ApplyController {

	public String searchList(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public String updateApply(Model model) throws Exception;

	public String insertApply(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public String deleteApply(Model model) throws Exception;

	public int memberCheck(@RequestParam("mem_Id") String mem_Id) throws Exception;
	
}
