package project.notify.controller;




import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.notify.service.NotifyService;
import project.notify.vo.NotifyVO;

@Controller

@RequestMapping("/notify/*")
public class notifyControllerImpl implements NotifyController {
	
	
	@Autowired
	NotifyService notifyService;
	
	
	
	/*
	 * @PostMapping("/insert") public String notifyInsert(NotifyVO notifyVO) throws
	 * Exception {
	 * 
	 * notifyService.notifyInsert(notifyVO);
	 * 
	 * return "redirect:/issue/list";
	 * 
	 * }
	 */
	 
	@RequestMapping("/update")
	
	
	public String notifyUpdate(NotifyVO notifyVO) throws Exception {
		System.out.println("str"+notifyVO);
		notifyService.notifyUpdate(notifyVO);
		
		return "redirect:/issue/list";
	
	}
	
	@GetMapping("/insert")
	public String test() {
		return "/notify/notifyadd";
	}
	@RequestMapping("/view")
	@ResponseBody
	public int ajview(HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("ok");
		int aaview = 0;
		int bbview = notifyService.viewNotify(aaview);
		return bbview;
	}
	@GetMapping("/list")
	public ModelAndView searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> searchMap = new HashMap<String, Object>();
		//searchMap.put("p_id", p_id);	 
		
		List<NotifyVO> list = notifyService.searchNotify(searchMap);
		
		
		ModelAndView mav = new ModelAndView("notify/notifyList");
		mav.addObject("notifyList", list);
		return mav;
		
	}
	
	}

