package project.jeongha.vote.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.jeongha.member.vo.MemberVO;
import project.jeongha.vote.service.VoteServiceImpl;
import project.jeongha.vote.vo.VoteVO;

@Controller
@RequestMapping("/vote/*")
public class VoteControllerImpl implements VoteController {

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
	public String voteInsert(VoteVO voteVO, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes rttr, HttpSession session) throws Exception {
		// System.out.println("controller: "+voteVO);
		// System.out.println(voteVO.getV_Num());
		// System.out.println(voteVO.getV_Content());

		// vote 테이블에 들어갈 정보
		Map<String, Object> v_Info = new HashMap<String, Object>();
		v_Info = (Map<String, Object>) session.getAttribute("member");
		v_Info.put("v_Num", voteVO.getV_Num());
		v_Info.put("v_Content", voteVO.getV_Content());
		// System.out.println("v_Info:" + v_Info);
		voteService.voteInsert(v_Info);

		String vd_Num[] = request.getParameterValues("vd_Num");
		String vd_Content[] = request.getParameterValues("vd_Content");
		// boted 테이블에 들어갈 정보
		Map<String, Object> vd_Info = new HashMap<String, Object>();
		for (int i = 0; i < vd_Num.length; i++) {
			vd_Info.put("v_Num", voteVO.getV_Num());
			vd_Info.put("vd_Num", vd_Num[i]);
			vd_Info.put("vd_Content", vd_Content[i]);
			voteService.votedInsert(vd_Info);

		}

		return "redirect:/vote/voteList";
	}

	@Override
	@GetMapping("/vote1")
	public String voteDelete() {
		// TODO Auto-generated method stub
		return "/vote/general";
	}

	//투표리스트
	@Override
	@RequestMapping(value = "/voteList", method = RequestMethod.GET)
	public ModelAndView voteList(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/vote/vote");
		//c_Id 협업공간 아이디 필요
		//투표 제목
		List<Map> voteList =voteService.voteList();
		//투표보기 리스트
		List<Map> votedList =voteService.votedList(); 
		
		mav.addObject("voteList", voteList);
		mav.addObject("votedList",votedList);
		
		return mav;
	}

}
