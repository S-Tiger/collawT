package project.sungho.apply.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project.sungho.apply.service.ApplyService;
import project.sungho.apply.vo.ApplyVO;
import project.sungho.cowork.vo.CoworkVO;

@Controller
@RequestMapping("/apply/*")
public class ApplyControllerImpl implements ApplyController {

	@Autowired
	ApplyService applyService;

	@Override
	public String searchList(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();

		Map<String, Object> searchMap = new HashMap<String, Object>();

		searchMap = (Map<String, Object>) session.getAttribute("member");

		List<ApplyVO> list = applyService.searchList(searchMap);

		model.addAttribute("applylist", list);

		return "apply/list";
	}

	@Override
	public String updateApply(Model model) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String insertApply(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
		}
		applyService.insertApply(dataMap);

		return "redirect:/main";
	}

	@Override
	public String deleteApply(Model model) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@GetMapping("memberCheck")
	@ResponseBody
	public int memberCheck(@RequestParam("mem_Id") String mem_Id) throws Exception {
		// TODO Auto-generated method stub
		int result= applyService.memberCheck(mem_Id);
		
		System.out.println("controller result:"+result);
		return result;
	}

}
