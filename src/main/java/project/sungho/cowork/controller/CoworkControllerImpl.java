package project.sungho.cowork.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project.sungho.cowork.service.CoworkService;
import project.sungho.cowork.vo.CoworkVO;


@Controller
@RequestMapping("/cowork/*")
public class CoworkControllerImpl implements CoworkController {
	
	@Autowired
	CoworkService coworkService;
	
	@Override
	@GetMapping("/list")
	public String searchList(Model model ,HttpServletRequest request, HttpServletResponse responsen) throws Exception {
		Map<String, Object> searchMap = new HashMap<String, Object>();
		
		HttpSession session = request.getSession();
		
		String mem_Id = (String)session.getAttribute("mem_Id");
				
		
		searchMap.put("mem_Id", mem_Id);	
		
		
		List<CoworkVO> list = coworkService.searchList(searchMap); //vo타입에 list를 생성하고 서비스에서 가져온 데이터를 list에 넣습니다
		
		model.addAttribute("coworklist", list); 
		
		return "cowork/list"; //뷰url지정해주세요
		
	}

	@Override
	public String updateCowork(Model model) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@PostMapping("/insert") 
	public String insertCowork(HttpServletRequest request, HttpServletResponse responsen) throws Exception {
		
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
		}
		coworkService.insertCowork(dataMap);
		
		return "redirect:/cowork/list";
		
	}

	@Override
	public String deleteCowork(Model model) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
