package project.jeongha.member.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.xmlbeans.impl.jam.mutable.MElement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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

import project.imgblob.ImgBlobVO;
import project.jeongha.member.dao.MemberDaoImpl;
import project.jeongha.member.service.MemberServiceImpl;
import project.jeongha.member.vo.MemberVO;
import project.sungho.cowork.service.CoworkService;
import project.sungho.cowork.vo.CoworkVO;

@Controller // 컨트롤러 어노테이션 컨트롤 마다 작성해주세요
@RequestMapping("/member/*") // 컨트롤러 맵핑 어노테이션 /패키지명/* 로 지정해주세요
public class MemberControllerImpl implements MemberController{

	@Autowired // 메모리할당 어노테이션 기존 자바 new로 선언하는 것들에 작성해주세요
	MemberServiceImpl service;

	@Autowired
	MemberDaoImpl dao;
	
	@Autowired
	CoworkService coworkService;
	
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
	public String findPw() {
		System.out.println("비밀번호 찾기 페이지");
		return "member/forgotPwd";
	}
	//비밀번호 찾기 페이지
		@Override
		@GetMapping("/outMember")
		public String outMember() {
			System.out.println("회원탈퇴 찾기 페이지");
			return "member/outMember";
		}
		@Override
		@GetMapping("/mypage")
		public String mypage() throws Exception {
			
			System.out.println("마이페이지");
			return "/member/mypage";
		}

	// @PostMapping("memJoin") //위아래중 편한걸로 사용하세요 URL 대소문자 구분하니 주의해주세요
	//회원가입
	@Override
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String memJoin(@ModelAttribute MemberVO memberVO,HttpServletRequest request, HttpServletResponse response)throws Exception { // 매게변수로 vo가 들어갔을경우 자동으로 변수이름에 맞는걸 set get 해줍니다.
		request.setCharacterEncoding("utf-8");													  //다른이름으로 지정하고 싶을 경우  ex : @ModelAttribute(변수이름) MeberVo memberVO
		Map<String,Object> joinMem =new HashMap<String, Object>();
		joinMem.put("mem_Id", memberVO.getMem_Id());
		joinMem.put("mem_Pwd", memberVO.getMem_Pwd());
		joinMem.put("mem_Name", memberVO.getMem_Name());		
		
		//으로하시면 변수이름. 으로 접근가능합니다
		service.memberJoin(joinMem,memberVO,response); 														// service에 memberRegister를 실행하는 부분
		//중복된 아이디를 가입했을때 오류가난다.
		//조건을 주자
		return "/member/loginPage"; // 리턴타입엔 패키지명/jsp파일 로 작성하여주세요 view에서도 패키지/jsp로 관리해주세요
	}
	
	//로그인 테스트 컨트롤러->회원정보수정
	@Override
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public ModelAndView memLogintest(MemberVO member,RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response)throws Exception {
		ModelAndView mav =new ModelAndView();
		System.out.println("로그인컨트롤러");
		Map<String, Object> memLogin = new HashMap<String, Object>();
		memLogin.put("mem_Id", member.getMem_Id());
		memLogin.put("mem_Pwd", member.getMem_Pwd());
		//로그인로직
		Map<String, Object> memberVO = service.login(memLogin);
		//로그인시 세션에.. 로그인성공
		if(memberVO != null) {
		System.out.println("로그인 성공(객체): "+memberVO);

		HttpSession session = request.getSession();
		session.setAttribute("member", memberVO);
		//jsp페이지에서 ${member.mem_Id}---->이런식으로 접근해야됨
		 
		List<CoworkVO> list = coworkService.searchList(memberVO);
		
		request.setAttribute("coworklist", list);
		
		mav.setViewName("redirect:/main");
		} else {//실패했을경우
		rAttr.addAttribute("result","loginFailed");
		mav.setViewName("redirect:/member/loginPage");
		
		}//end if

		return mav;
	}

	// mypage 수정
		@RequestMapping(value = "/update_mypage", method = RequestMethod.POST)
		public String update_mypage(@ModelAttribute MemberVO memberVO, HttpSession session, RedirectAttributes rttr) throws Exception{
	         System.out.println("수정");
	         System.out.println(memberVO.getMem_Id());
	         System.out.println(memberVO.getMem_Name());
	         Map<String,Object> member00 = new HashMap<String,Object>();
			member00 =(Map<String,Object>) session.getAttribute("member");
			System.out.println("세션에서 가져온거member00 :"+member00);
			member00.put("mem_Id", memberVO.getMem_Id());
			member00.put("mem_Name", memberVO.getMem_Name());
	         service.updateMypage(member00);
	         rttr.addFlashAttribute("msg", "회원정보 수정 완료");
	         session.setAttribute("member", member00);
	         return "/main/index";
	      }
		
		// 비밀번호 변경
		@RequestMapping(value = "/update_pw", method = RequestMethod.POST)
		public String update_pw(@ModelAttribute MemberVO memberVO, @RequestParam("old_pw") String old_pw, HttpSession session, HttpServletResponse response, RedirectAttributes rttr) throws Exception{
			System.out.println(old_pw);
			System.out.println(memberVO.getMem_Id());
			System.out.println(memberVO.getMem_Pwd());
			System.out.println(memberVO.getMem_Name());
			MemberVO member = service.update_pw(memberVO, old_pw, response);
//			if(memberVO!=null) {
			rttr.addAttribute("msg", "");
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
			//아이디가 있는지 없는지 있으면 1 없으면 0
			int result= service.check_id(mem_Id);
			
			System.out.println("controller result:"+result);
			return result;
		}
		
		//비밀번호 찾기
		@Override
		@RequestMapping(value = "/find_pw", method = RequestMethod.POST)
		public void find_pw(Map<String,Object> member, MemberVO memberVO, HttpServletResponse response) throws Exception {
			// TODO Auto-generated method stub
			service.find_pw(response, memberVO, member);
		}

		//회원 탈퇴
		@Override
		@RequestMapping(value = "delete_Member")
		public String delete_Member(@ModelAttribute MemberVO memberVO,@RequestParam ("pwd")String pwd, HttpServletResponse response, HttpSession session, RedirectAttributes rttr)throws Exception {
			System.out.println("ccccccccccccccccccccccc");
			System.out.println("pwd: "+pwd);
			System.out.println("Id: "+memberVO.getMem_Id());
			MemberVO member = service.delete_Member(memberVO, pwd, response);
			//세션초기화
			session.invalidate();
			
			return "redirect:/";
		}
		
		//이미지 저장
		@Override
		@RequestMapping(value = "/saveImage")
		public String saveImage(MemberVO memberVO,HttpServletResponse request,HttpServletResponse response,HttpSession session) throws Exception{
			//이미지 저장 컨트롤러
			System.out.println(memberVO.getMem_Id());
			System.out.println(memberVO.getMem_File().getBytes());
			Map<String,Object> member00 = new HashMap<String,Object>();
			member00 =(Map<String,Object>) session.getAttribute("member");
			System.out.println("세션에서 가져온거member00 :"+member00);
				try {
					
					//Map<String, Object> member = new HashMap<String, Object>();
					member00.put("mem_File", memberVO.getMem_File().getBytes());
					
					System.out.println("ImgSave Controller: "+member00);
					dao.saveImage(member00);
					//세션 문제 추가...
					session.setAttribute("member",member00);
				} catch (Exception e) {
					e.printStackTrace();
				}
				return "/main/index";
			}

		//프로필 사진가져옴  /getByteImage?mem_Id=
		@RequestMapping(value = "/getByteImage", method = RequestMethod.GET)
		public ResponseEntity<byte[]> getByteImage(@RequestParam("mem_Id")String mem_Id) {
			System.out.println("그림파일 가져오기");
			System.out.println("dao.getByteImage: "+dao.getByteImage(mem_Id));
			Map<String, Object> img = dao.getByteImage(mem_Id);
			//blob컬럼명 img.get("mem_File")
			byte[] imageContent = (byte[]) img.get("mem_File");
			System.out.println("getImg: "+img.get("mem_File"));
			final HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_PNG);
			return new ResponseEntity<byte[]>(imageContent, headers, HttpStatus.OK);
		}

		@Override
		@RequestMapping(value = "/mypage1")
		public String resize() {
			// TODO Auto-generated method stub
			System.out.println("1234123412341234");
			return "/member/mypage1";
		}
		@Override
		@RequestMapping(value = "/profile")
		public String profile() {
			// TODO Auto-generated method stub
			System.out.println("1234123412341234");
			return "/member/profile";
		}
		
}