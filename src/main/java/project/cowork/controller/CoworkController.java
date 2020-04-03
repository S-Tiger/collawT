package project.cowork.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;



public interface CoworkController {
	public String searchList(String mem_Id, Model model) throws Exception;
	
	public String updateCowork(Model model) throws Exception;
	public String insertCowork(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String deleteCowork(Model model) throws Exception;

}
