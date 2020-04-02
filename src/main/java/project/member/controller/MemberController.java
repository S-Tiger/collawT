package project.member.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.member.vo.MemberVO;

public interface MemberController {
//	public String getServerTime(Locale locale);

public String signup();

public String loginFrorm();
public String mypage()throws Exception;

public String memJoin(MemberVO memberVO,HttpServletRequest request, HttpServletResponse response)throws Exception;

public ModelAndView memLogin(MemberVO member,RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response)throws Exception;

public ModelAndView memLogintest(MemberVO member,RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response)throws Exception ;

public String memUpdate(MemberVO member,RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response)throws Exception;
public String update_mypage(MemberVO member, HttpSession session, RedirectAttributes rttr) throws Exception;
	
public String update_pw(MemberVO member, String old_pw, HttpSession session, HttpServletResponse response, RedirectAttributes rttr) throws Exception;
public String logout(HttpSession session, HttpServletResponse response) throws Exception;

}
