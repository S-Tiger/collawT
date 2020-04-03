package project.sungho.comember.controller;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import project.sungho.cowork.vo.CoworkVO;

public interface ComemberController {

public String searchList(String mem_Id, Model model) throws Exception;
	
	public String updateCowork(Model model) throws Exception;
	public String insertCowork(CoworkVO coworkVO, HttpSession session) throws Exception;
	public String deleteCowork(Model model) throws Exception;
	
}