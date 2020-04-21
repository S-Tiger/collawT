package project.sungho.bookmark.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import project.sungho.apply.vo.ApplyVO;

public interface BookmarkController {

	public String searchList(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public String updateBookmark(Model model) throws Exception;

	public int insertBookmark(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public int deleteBookmark(HttpServletRequest request, HttpServletResponse responsel) throws Exception;

	public int bookmarkCheck(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public int acceptBookmark(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public int rejectBookmark(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
