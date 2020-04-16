package project.sungho.comember.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import project.sungho.comember.service.ComemberService;
import project.sungho.comember.vo.ComemberVO;
import project.sungho.cowork.vo.CoworkVO;


@Controller
public class ComemberControllerImpl implements ComemberController {
	
	@Autowired
	ComemberService comemberService;

	
	//회원별 가입한 공간리스트를 불러오기위한 컨트롤러
	@Override
	public String searchList(Model model ,HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> searchMap = new HashMap<String, Object>();
		
		HttpSession session = request.getSession();
		
		String mem_Id = (String)session.getAttribute("mem_Id");
				
		searchMap.put("mem_Id", mem_Id);	
		
		List<Map> list = comemberService.searchList(searchMap); 
		
		model.addAttribute("coworklist", list); 
		
		return "cowork/list"; 
		
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
