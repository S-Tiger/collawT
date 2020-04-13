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

	@Override
	public String searchList(Model model ,HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> searchMap = new HashMap<String, Object>();
		
		HttpSession session = request.getSession();
		
		String mem_Id = (String)session.getAttribute("mem_Id");
				
		searchMap.put("mem_Id", mem_Id);	
		
		
		List<Map> list = comemberService.searchList(searchMap); //vo타입에 list를 생성하고 서비스에서 가져온 데이터를 list에 넣습니다
		
		model.addAttribute("coworklist", list); 
		
		return "cowork/list"; //뷰url지정해주세요
		
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
