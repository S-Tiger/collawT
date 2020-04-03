package project.jeongha.member.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.xmlbeans.impl.jam.mutable.MElement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpOutputMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.jeongha.member.service.MemberServiceImpl;
import project.jeongha.member.vo.MemberVO;

@Controller // 컨트롤러 어노테이션 컨트롤 마다 작성해주세요
@RequestMapping("/member/*") // 컨트롤러 맵핑 어노테이션 /패키지명/* 로 지정해주세요
public class MemberControllerImpl implements MemberController{

	@Autowired // 메모리할당 어노테이션 기존 자바 new로 선언하는 것들에 작성해주세요
	MemberServiceImpl service;

//	@Override
//	@ModelAttribute("serverTime") // 모델어트리뷰트 어노테이션은 이컨트롤러가 매핑어뎁터로 메소드를 실행하기전에 먼저 실행하는 메소드 입니다.
//	public String getServerTime(Locale locale) { // 이경우 jsp에 ${serverTime} 으로 현재시간을 리턴하는데
//													// 다른방법으로도 사용가능하니 사용하실려면 사용하세요
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		return dateFormat.format(date);
//	}
	
	//회원가입페이지
	@Override
	@GetMapping("/signup")
	public String signup() {
		System.out.println("회원가입페이지");
		return "/member/signup";
	}
	
	//로그인 페이지
	@Override
	@GetMapping("/loginPage")
	public String loginFrorm() {
		System.out.println("로그인페이지");
		return "member/loginPage";
	}
	
	//비밀번호 찾기 페이지
	@Override
	@GetMapping("/forgotPwd")
	public String forgot() {
		System.out.println("비밀번호 찾기 페이지");
		return "member/forgotPwd";
	}
	
	// @PostMapping("memJoin") //위아래중 편한걸로 사용하세요 URL 대소문자 구분하니 주의해주세요
	//회원가입정보등록 DB
	@Override
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String memJoin(@ModelAttribute MemberVO memberVO,HttpServletRequest request, HttpServletResponse response)throws Exception { // 매게변수로 vo가 들어갔을경우 자동으로 변수이름에 맞는걸 set get 해줍니다.
		request.setCharacterEncoding("utf-8");													  //다른이름으로 지정하고 싶을 경우  ex : @ModelAttribute(변수이름) MeberVo memberVO
																							//으로하시면 변수이름. 으로 접근가능합니다
		service.memberJoin(memberVO,response); 														// service에 memberRegister를 실행하는 부분
		//중복된 아이디를 가입했을때 오류가난다.
		//조건을 주자
		return "/member/loginPage"; // 리턴타입엔 패키지명/jsp파일 로 작성하여주세요 view에서도 패키지/jsp로 관리해주세요
	}

	
	//로그인 
	@Override
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public ModelAndView memLogin(MemberVO member,RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response)throws Exception {
		System.out.println(request.getContextPath());
//		String memId=(String)request.getParameter("memId");
//		String memPw=(String)request.getParameter("memPw");
		System.out.println(member.getMem_Id());
		System.out.println(member.getMem_Pwd());
		ModelAndView mav =new ModelAndView();
		System.out.println("로그인컨트롤러");
		//로그인로직
		MemberVO memVO = service.login(member);
		System.out.println(member);
		//로그인시 세션에.. 로그인성공
		if(memVO != null) {
		HttpSession session = request.getSession();
		
		session.setAttribute("mem_name", memVO.getMem_Name());
		session.setAttribute("mem_pwd", memVO.getMem_Pwd());
		session.setAttribute("isLogin", true);
		mav.setViewName("/main/index");
		
		}else {//실패했을경우
			rAttr.addFlashAttribute("result","loginFailed");
		mav.setViewName("redirect:/member/loginPage");
		
		}

		return mav;
	}
	
	
	//로그인 테스트 컨트롤러->회원정보수정
	@Override
	@RequestMapping(value = "/loginTest",method = RequestMethod.POST)
	public ModelAndView memLogintest(MemberVO member,RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response)throws Exception {
		ModelAndView mav =new ModelAndView();
		System.out.println("로그인컨트롤러");
		//로그인로직
		MemberVO memberVO = service.login(member);
		//로그인시 세션에.. 로그인성공
		if(memberVO != null) {
		HttpSession session = request.getSession();
		session.setAttribute("mem_Name", memberVO.getMem_Name());
		session.setAttribute("mem_Pwd", memberVO.getMem_Pwd());
		session.setAttribute("mem_Id", memberVO.getMem_Id());
		session.setAttribute("isLogin", true);
		mav.setViewName("/main/index");
		}else {//실패했을경우
		rAttr.addAttribute("result","loginFailed");
		mav.setViewName("redirect:/member/loginPage");
		
		}//end if

		return mav;
	}

	@Override
	@RequestMapping(value = "/updateMember",method = RequestMethod.POST)
	public String memUpdate(MemberVO member,RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response)throws Exception  {

		service.memberUpdate(member);
		return "redirect:/member/loginOk";
		
	}

	@Override
	@GetMapping("/mypage")
	public String mypage() throws Exception {
		
		System.out.println("마이페이지");
		return "/member/mypage";
	}

	// mypage 수정
		@RequestMapping(value = "/update_mypage", method = RequestMethod.POST)
		public String update_mypage(@ModelAttribute MemberVO member, HttpSession session, RedirectAttributes rttr) throws Exception{
	         System.out.println("수정");
	         System.out.println(member.getMem_Id());
	         System.out.println(member.getMem_Name());
	         service.updateMypage(member);
	         rttr.addFlashAttribute("msg", "회원정보 수정 완료");
	         session.setAttribute("mem_Name", member.getMem_Name());
	         return "/main/index";
	      }
		
		// 비밀번호 변경
		@RequestMapping(value = "/update_pw", method = RequestMethod.POST)
		public String update_pw(@ModelAttribute MemberVO member, @RequestParam("old_pw") String old_pw, HttpSession session, HttpServletResponse response, RedirectAttributes rttr) throws Exception{
			System.out.println(old_pw);
			System.out.println(member.getMem_Id());
			System.out.println(member.getMem_Pwd());
			System.out.println(member.getMem_Name());
			MemberVO memberVO = service.update_pw(member, old_pw, response);
//			if(memberVO!=null) {
			session.setAttribute("member", memberVO);
			rttr.addAttribute("msg", "비밀번호 수정 완료");
			return "redirect:/member/mypage";
//			}else {
//				rttr.addAttribute("msg", "실패");
//				return "redirect:/member/mypage";
//			}
		}
	

		// 아이디 중복 검사(AJAX)
		@RequestMapping(value = "/check_id", method = RequestMethod.GET)
		@ResponseBody   //리스폰스바디는 매소드가 스트링이거나 타입이 있을때 ajax로통신할 경우 꼭써야함그렇게 하지 않으면 뷰 리졸버가 반응을함.
		public int check_id(@RequestParam("mem_Id") String mem_Id) throws Exception{
		
			System.out.println("아작스");
			System.out.println(mem_Id);
			int result= service.check_id(mem_Id);
			System.out.println("controller result:"+result);
//			PrintWriter out = response.getWriter();
//			if(result == 1) {
//				out.print("no_usable");
//			}else {
//				out.print("usable");
//			}
			return result;
		}
		//비밀번호 찾기
		@Override
		@RequestMapping(value = "/find_pw", method = RequestMethod.POST)
		public void find_pw(MemberVO member, HttpServletResponse response) throws Exception {
			// TODO Auto-generated method stub
			service.find_pw(response, member);
		}
	

}