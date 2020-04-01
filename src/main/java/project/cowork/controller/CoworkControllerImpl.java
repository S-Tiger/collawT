package project.cowork.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.cowork.service.CoworkService;
import project.cowork.vo.CoworkVO;
import project.issue.vo.IssueVO;

@Controller
@RequestMapping("/work/*")
public class CoworkControllerImpl implements CoworkController {
	
	@Autowired
	CoworkService coworkService;

	@Override
	@GetMapping("/list") //뿌려지는건 Get매핑
	public String searchList(@RequestParam(value="mem_Id", required=false)String mem_Id, Model model) throws Exception {
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("mem_Id", mem_Id);	 
		
		List<CoworkVO> list = coworkService.searchList(searchMap); //vo타입에 list를 생성하고 서비스에서 가져온 데이터를 list에 넣습니다
		
		model.addAttribute("work_List", list); //work_List 라는 이름으로 list객체를 넣습니다
		
		return "url"; //뷰url지정해주세요
		
	}

	@Override
	public String updateCowork(Model model) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@PostMapping("/insert") 
	public String insertCowork(CoworkVO coworkVO) throws Exception {

		coworkService.insertCowork(coworkVO);
		
		return null;
	}

	@Override
	public String deleteCowork(Model model) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
