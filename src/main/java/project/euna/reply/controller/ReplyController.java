package project.euna.reply.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import project.euna.issue.vo.IssueVO;
import project.euna.reply.vo.ReplyVO;

public interface ReplyController {
	public String replyInsert(ReplyVO replyVO, HttpSession session) throws Exception;
}
