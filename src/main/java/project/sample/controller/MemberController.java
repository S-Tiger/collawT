package project.sample.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project.sample.service.MemberServiceImpl;
import project.sample.vo.MemberVO;

@Controller // 컨트롤러 어노테이션 컨트롤 마다 작성해주세요
@RequestMapping("/sample/*") // 컨트롤러 맵핑 어노테이션 /패키지명/* 로 지정해주세요
public class MemberController {

	@Autowired // 메모리할당 어노테이션 기존 자바 new로 선언하는 것들에 작성해주세요
	MemberServiceImpl service;

	@ModelAttribute("serverTime") // 모델어트리뷰트 어노테이션은 이컨트롤러가 매핑어뎁터로 메소드를 실행하기전에 먼저 실행하는 메소드 입니다.
	public String getServerTime(Locale locale) { // 이경우 jsp에 ${serverTime} 으로 현재시간을 리턴하는데
													// 다른방법으로도 사용가능하니 사용하실려면 사용하세요
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		return dateFormat.format(date);
	}

	// @PostMapping("memJoin") //위아래중 편한걸로 사용하세요 URL 대소문자 구분하니 주의해주세요
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String memJoin(MemberVO memberVO) { // 매게변수로 vo가 들어갔을경우 자동으로 변수이름에 맞는걸 set get 해줍니다.
										  //다른이름으로 지정하고 싶을 경우  ex : @ModelAttribute(변수이름) MeberVo memberVO
										  //으로하시면 변수이름. 으로 접근가능합니다
		service.memberRegister(memberVO); // service에 memberRegister를 실행하는 부분

		return "sample/joinOk"; // 리턴타입엔 패키지명/jsp파일 로 작성하여주세요 view에서도 패키지/jsp로 관리해주세요
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String memLogin(MemberVO memberVO) {

		service.memberSearch(memberVO);

		return "sample/loginOk";
	}

}