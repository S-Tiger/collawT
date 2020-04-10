package home.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response, Object handler) {
		
		
		HttpSession session = request.getSession();
		Map<String, Object> member = new HashMap<String,Object>();
		
		member = (Map<String, Object>) session.getAttribute("member");
		
		String uri = (String) request.getRequestURI();
		if (member != null) {
			return "redirect:/main";
			}else {
		
		return "index";
	}}

	@RequestMapping("/join")
	public String join(Model model) {
		
		return "sample/joinForm";
	}
	
	
	
	@RequestMapping("/issueadd")
	public String projectadd(Model model) {

		return "/issue/issueadd";
	}
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletResponse response) throws Exception{
		session.invalidate();
		return "redirect:/";
	}
	@RequestMapping("/main")
	public String main(Model model) {
	return "main/index";
	}
	
	
}
