package project.sungho.calendar.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import project.sungho.calendar.service.CalendarService;

@Controller
@RequestMapping("/calendar/*")
public class CalendarControllerImpl implements CalendarController {
	
	@Autowired
	CalendarService calendarService;

	@Override
	@GetMapping("/main")
	public String main(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return "/calendar/allcalendar";
	}
	
	@Override
	@GetMapping("/list")
	@ResponseBody
	public List<Map> searchList(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> searchMap = new HashMap<String, Object>();
		
		HttpSession session = request.getSession();
		
		searchMap = (Map<String, Object>) session.getAttribute("member");
				
		System.out.println("---------------------------------------------"+searchMap);
		
		List<Map> eventlist = calendarService.searchList(searchMap);
		
		System.out.println("---------------------------------------------"+eventlist);
		model.addAttribute("calendarlist", eventlist); 
		
		return eventlist;
	}





}
