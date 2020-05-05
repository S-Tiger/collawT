package project.jeongha.reply.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project.jeongha.reply.service.VoteReplyService;
import project.jeongha.reply.vo.VoteReplyVO;

@Controller
@RequestMapping("/voteReply/*")
public class VoteReplyControllerImpl implements VoteReplyController {

	@Inject
	VoteReplyService voteReplyService;
	
	@PostMapping("/insert")
	@ResponseBody
	@Override
	public String voteReplyInsert(VoteReplyVO voteReplyVO, HttpSession session) throws Exception {
		Map<String, Object> member = new HashMap<String,Object>();
		member = (Map<String, Object>) session.getAttribute("member");
		String mem_Id = (String) member.get("mem_Id");
		
		voteReplyVO.setMem_Id(mem_Id);

	
		voteReplyService.voteReplyInsert(voteReplyVO);
		System.out.println("!!!!!!!!!!!!!!!!!1 controller : "+voteReplyVO.getC_Id());
				
		return "redirect:/reply/list";	}

	//댓글 목록
	@Override
	@GetMapping("/list")
	@ResponseBody
	public List<Map> voteSearchList(@RequestParam ("v_Num")String v_Num, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		List<Map> list=voteReplyService.voteSearchList(v_Num);
		return list;
	}
	
	@Override
	@PostMapping("/delete")
	@ResponseBody
	public void voteReplyDelete(VoteReplyVO voteReplyVO) throws Exception {
		System.out.println("xxxx");
		voteReplyService.voteReplyDelete(voteReplyVO);
		
	}

	//게시글 수정 db에 넣기
	@Override
	@PostMapping("/update")
	@ResponseBody
	public void voteReplyUpdate(VoteReplyVO voteReplyVO) throws Exception {
		System.out.println("vr_Content:"+voteReplyVO.getVr_Content());
		System.out.println("vr_num: "+voteReplyVO.getVr_Num());
		voteReplyService.voteReplyUpdate(voteReplyVO);
		
	}


}
