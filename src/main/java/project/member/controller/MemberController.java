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
	public String getServerTime(Locale locale);

public String signup();

public String loginFrorm();

public String memJoin(MemberVO memberVO,HttpServletRequest request, HttpServletResponse response)throws Exception;

<<<<<<< HEAD
	
	//로그인 
	@RequestMapping(value = "/login")
	public ModelAndView memLogin(MemberVO memberVO,RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response)throws Exception {
		
//		String memId=(String)request.getParameter("memId");
//		String memPw=(String)request.getParameter("memPw");
		ModelAndView mav =new ModelAndView();
		System.out.println("로그인컨트롤러");
		//로그인로직
		MemberVO memVO = service.login(memberVO);
		System.out.println(memVO);
		//로그인시 세션에.. 로그인성공
		if(memVO != null) {
		HttpSession session = request.getSession();
		
		session.setAttribute("member", memVO.getMem_Name());
		session.setAttribute("isLogin", true);
		mav.setViewName("/main/index");
		
		}else {//실패했을경우
			rAttr.addAttribute("result","loginFailed");
		mav.setViewName("redirect:/member/loginForm");
		
		}
=======
public ModelAndView memLogin(MemberVO member,RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response)throws Exception;
>>>>>>> refs/remotes/origin/master

public ModelAndView memLogintest(MemberVO member,RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response)throws Exception ;

}
