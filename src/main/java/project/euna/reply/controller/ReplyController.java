package project.euna.reply.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import project.euna.reply.vo.ReplyVO;

public interface ReplyController {
	public String replyInsert(ReplyVO replyVO, HttpSession session) throws Exception;
	public List<Map> searchList(@RequestParam String i_Num, HttpServletRequest request, HttpServletResponse response) throws Exception;
	//public ResponseEntity<List<Map>> searchList(@PathVariable("i_Num") String i_Num);
}
