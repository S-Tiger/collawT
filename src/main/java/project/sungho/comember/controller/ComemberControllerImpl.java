package project.sungho.comember.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import project.sungho.cowork.vo.CoworkVO;


@Controller
public class ComemberControllerImpl implements ComemberController {

	@Override
	public String searchList(String mem_Id, Model model) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String updateCowork(Model model) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String insertCowork(CoworkVO coworkVO, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String deleteCowork(Model model) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
