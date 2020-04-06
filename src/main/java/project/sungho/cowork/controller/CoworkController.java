package project.sungho.cowork.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;



public interface CoworkController {
	public String searchList(Model model, HttpServletRequest request, HttpServletResponse responsen) throws Exception;
	
	public String updateCowork(Model model) throws Exception;
	public String insertCowork(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String deleteCowork(Model model, HttpServletRequest request, HttpServletResponse responsen) throws Exception;

}
