package project.sungho.chat.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import project.sungho.chat.dao.ChatDAO;

@Controller
@RequestMapping("/chatmsg/*")
public class ChatControllerImpl implements ChatController{
	
	@Autowired
	ChatDAO chatDAO;

	@Override
	@GetMapping("/list")
	@ResponseBody
	public List<Map> searchList(Model model, HttpServletRequest request, HttpServletResponse response)throws Exception {
		String target_Id = (String)request.getParameter("target_Id");
		
		HttpSession session = request.getSession();
		Map<String, Object> searchMap = new HashMap<String,Object>();
		searchMap = (Map<String, Object>) session.getAttribute("member");
		searchMap.put("target_Id", target_Id);
		
		List<Map>chatlist = chatDAO.searchList(searchMap);
		
		return chatlist;
	}

}
