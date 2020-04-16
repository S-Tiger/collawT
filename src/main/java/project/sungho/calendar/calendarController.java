package project.sungho.calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface calendarController {

	public String searchList(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception;

}
