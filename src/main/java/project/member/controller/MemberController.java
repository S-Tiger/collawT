package project.member.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.member.vo.MemberVO;

public interface MemberController {

	public String getServerTime(Locale locale);

	public String signup();

	public String loginFrorm();

	public String memJoin(MemberVO memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView memLogin(MemberVO member, RedirectAttributes rAttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView memLogintest(MemberVO member, RedirectAttributes rAttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

}
