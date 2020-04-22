package project.jeongha.vote.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.euna.issue.vo.Criteria;
import project.jeongha.member.vo.MemberVO;
import project.jeongha.vote.vo.VoteVO;

public interface VoteController {
	
	
	public String votePage();
	public String voteInsert(VoteVO voteVO,HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr,HttpSession session )throws Exception ;
	public String voteDelete();
	public ModelAndView voteList(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception ;

}
