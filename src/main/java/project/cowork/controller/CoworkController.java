package project.cowork.controller;

import org.springframework.ui.Model;
import project.cowork.vo.CoworkVO;


public interface CoworkController {
	public String searchList(String mem_Id, Model model) throws Exception;
	
	public String updateCowork(Model model) throws Exception;
	public String insertCowork(CoworkVO coworkVO) throws Exception;
	public String deleteCowork(Model model) throws Exception;

}
