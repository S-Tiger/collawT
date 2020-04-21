package project.jeongha.vote.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.jeongha.member.vo.MemberVO;
import project.jeongha.vote.service.VoteServiceImpl;
import project.jeongha.vote.vo.VoteVO;


@Controller
@RequestMapping("/vote/*")
public class VoteControllerImpl implements VoteController{

	@Autowired
	VoteServiceImpl voteService;
	
	@Override
	@GetMapping("/vote")
	public String votePage() {
		// TODO Auto-generated method stub
		return "/vote/vote";
	}

	@Override
	@RequestMapping(value = "/voteInsert", method = RequestMethod.GET)
	public String voteInsert(VoteVO voteVO,HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr,HttpSession session ) throws Exception {
		System.out.println("controller: "+voteVO);
		System.out.println(voteVO.getV_Content());
		System.out.println(voteVO.getV_End());
		System.out.println(voteVO.getV_Num());
		System.out.println(voteVO.getV_Start());
		
		Map<String, Object> v_Info = new HashMap<String, Object>();
		v_Info = (Map<String, Object>) session.getAttribute("member");
		v_Info.put("v_Num", voteVO.getV_Num());
		v_Info.put("v_Content", voteVO.getV_Content());
		System.out.println(v_Info);
		voteService.voteInsert(v_Info);
		
		
		return "redirect:/vote/vote";
	}

	@Override
	public String voteDelete() {
		// TODO Auto-generated method stub
		return null;
	}
	
	


}
