package home.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

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
	public String home(Locale locale, Model model) {
		
		return "main/index";
	}

	@RequestMapping("/join")
	public String join(Model model) {
		
		return "sample/joinForm";
	}
	
	@RequestMapping("/issue")
	public String project(Model model) {

		return "/issue//issue";
	}
	
	@RequestMapping("/issueadd")
	public String projectadd(Model model) {

		return "/issue/issueadd";
	}
	
}
