package project.jeongha.member.controller;

import java.io.IOException;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.jeongha.member.vo.MemberVO;

public interface MemberController {
//	public String getServerTime(Locale locale);

public String signup();
public String loginFrorm();
public String mypage()throws Exception;
public String memJoin(MemberVO memberVO,HttpServletRequest request, HttpServletResponse response)throws Exception;
//public ModelAndView memLogin(MemberVO memberVO,RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response)throws Exception;
public ModelAndView memLogintest(MemberVO memberVO,RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response)throws Exception ;
public String update_mypage(MemberVO memberVO, HttpSession session, RedirectAttributes rttr) throws Exception;
public String update_pw(MemberVO memberVO, String old_pw, HttpSession session, HttpServletResponse response, RedirectAttributes rttr) throws Exception;
public int check_id(@RequestParam("mem_Id") String mem_Id) throws Exception;
public String findPw() ;
public void find_pw(Map<String,Object> member,MemberVO memberVO, HttpServletResponse response) throws Exception;
public String outMember() ;
public String delete_Member(MemberVO memberVO,String pw,HttpServletResponse response, HttpSession session, RedirectAttributes rttr)throws Exception;
public String saveImage(MemberVO memberVO,HttpServletResponse request,HttpServletResponse response, HttpSession session) throws Exception;
public ResponseEntity<byte[]> getByteImage(String mem_Id) ;
public String resize();
public String profile();
public String naverLogin(Model model, HttpSession session);
public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException;
public String naverLogin();
public String logsuccess();
}
