package project.euna.personal.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.euna.appendix.vo.AppendixVO;
import project.euna.personal.vo.Criteria;
import project.euna.personal.vo.PersonalVO;

public interface PersonalController {
//
	public ModelAndView searchList(PersonalVO personalVO, Criteria cri, String c_Id, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception;
//	public String personalInsert(personalVO personalVO, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception;
//	public ModelAndView personalInsert(String c_Id, HttpSession session);
//	
//	public ModelAndView personalRead(String i_Num, HttpServletRequest request, HttpServletResponse response) throws Exception;
//	
//	public String personalDelete(String c_Id, String i_Num, personalVO personalVO) throws Exception;
//	
//	public String personalUpdate(String c_Id, String i_Num, personalVO personalVO, Model model) throws Exception;
//	public String personalUpdate(personalVO personalVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
//	public void communityImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload);
//	public String personalCopy(personalVO personalVO, HttpSession session, HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr) throws Exception;
}

