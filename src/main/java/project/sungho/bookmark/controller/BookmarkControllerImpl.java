package project.sungho.bookmark.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project.jeongha.member.service.MemberService;
import project.sungho.apply.service.ApplyService;
import project.sungho.bookmark.service.BookmarkService;
import project.sungho.comember.service.ComemberService;

@Controller
@RequestMapping("/bookmark/*")
public class BookmarkControllerImpl implements BookmarkController {

	@Autowired
	BookmarkService bookmarService;

	@Override
	@RequestMapping("/list")
	@ResponseBody
	public List<Map> searchList(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap = (Map<String, Object>) session.getAttribute("member");
		List<Map> bookmarkList = bookmarService.searchList(searchMap);

		return bookmarkList;
	}

	@Override
	public String updateBookmark(Model model) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@PostMapping("insert")
	@ResponseBody
	public int insertBookmark(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		Map<String, Object> memberVO = (Map<String, Object>) session.getAttribute("member");
		
		String i_Num = request.getParameter("i_Num");
		String mem_Id =  (String) memberVO.get("mem_Id");
		
		dataMap.put("i_Num", i_Num);
		dataMap.put("mem_Id", mem_Id);
		
		return bookmarService.insertBookmark(dataMap);

	}
	
	

	@Override
	@PostMapping("delete")
	@ResponseBody
	public int deleteBookmark(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		Map<String, Object> memberVO = (Map<String, Object>) session.getAttribute("member");
		
		String i_Num = request.getParameter("i_Num");
		String mem_Id =  (String) memberVO.get("mem_Id");
		
		dataMap.put("i_Num", i_Num);
		dataMap.put("mem_Id", mem_Id);
		
		return bookmarService.deleteBookmark(dataMap);
	}

	@Override
	@GetMapping("bookmarkCheck") //ajax 회원체크를 위한 맴버체크
	@ResponseBody
	public int bookmarkCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		Map<String, Object> memberVO = (Map<String, Object>) session.getAttribute("member");
		
		String i_Num = request.getParameter("i_Num");
		String mem_Id =  (String) memberVO.get("mem_Id");

		dataMap.put("i_Num", i_Num);
		dataMap.put("mem_Id", mem_Id);
		
		int result= bookmarService.bookmarkCheck(dataMap);
		
		return result;
	}

	
	//초대 수락을 위한 ajax 컨트롤러
	@Override
	@GetMapping("accept")
	@ResponseBody
	public int acceptBookmark(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
		}
		return bookmarService.acceptBookmark(dataMap);
	}
	
	
	
	//초대 거절을 위한 ajax 컨트롤러 
	@Override
	@GetMapping("reject")
	@ResponseBody
	public int rejectBookmark(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
		}
		return bookmarService.rejectBookmark(dataMap);
	}
	

}
