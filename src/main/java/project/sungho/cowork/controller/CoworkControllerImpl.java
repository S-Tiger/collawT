package project.sungho.cowork.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
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
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.ModelAndView;

import project.sungho.comember.service.ComemberService;
import project.sungho.cowork.service.CoworkService;
import project.sungho.cowork.vo.CoworkVO;


@Controller
@RequestMapping("/project/*")
public class CoworkControllerImpl implements CoworkController {
	
	@Autowired
	CoworkService coworkService;
	@Autowired
	ComemberService comemberService;
	
	
	
	@Override
	@GetMapping("/list")
	public String searchList(Model model ,HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> searchMap = new HashMap<String, Object>();
		
		HttpSession session = request.getSession();
		
		String mem_Id = (String)session.getAttribute("mem_Id");
				
		searchMap.put("mem_Id", mem_Id);	
		
		
		System.out.println("공간------------------------------------------------------------------"+mem_Id);
		
		List<CoworkVO> list = coworkService.searchList(searchMap); //vo타입에 list를 생성하고 서비스에서 가져온 데이터를 list에 넣습니다
		
		model.addAttribute("coworklist", list); 
		
		return "cowork/list"; //뷰url지정해주세요
		
	}
	
	
	@Override
	@GetMapping("/main")
	public String searchMain(Model model ,HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> searchMap = new HashMap<String, Object>();
		String c_Id = (String)request.getParameter("c_Id");
		
		searchMap.put("c_Id", c_Id);
		
		Map<String, Object>pjt = coworkService.searchMain(searchMap); //vo타입에 list를 생성하고 서비스에서 가져온 데이터를 list에 넣습니다
		List<Map>memberList = comemberService.memberList(searchMap);
		model.addAttribute("pjt", pjt); 
		model.addAttribute("memberList", memberList);
		
		return "/cowork/main"; //뷰url지정해주세요
		
	}
	
	@Override
	@PostMapping("/update")
	public String updateCowork(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> dataMap = new HashMap<String, Object>();
		String c_Id = request.getParameter("c_Id");
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
		}
		coworkService.updateCowork(dataMap);
		
		return "redirect:/project/main?c_Id="+c_Id; 
		
	}

	@Override
	@PostMapping("/insert") 
	public String insertCowork(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
		}
		coworkService.insertCowork(dataMap);
		
		return "redirect:/main";
		
	}

	@Override
	@PostMapping("/delete")
	public String deleteCowork(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> dataMap = new HashMap<String, Object>();

		String c_Id = request.getParameter("c_Id");

		dataMap.put("c_Id", c_Id);

		coworkService.deleteCowork(dataMap);

		return "redirect:/main";
	}
	
	@RequestMapping("/create")
	public String project(Model model) {

		return "cowork/coworkinsert";
	}

}
