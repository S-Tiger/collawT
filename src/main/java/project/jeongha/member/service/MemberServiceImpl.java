package project.jeongha.member.service;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import project.jeongha.member.dao.MemberDaoImpl;
import project.jeongha.member.vo.MemberVO;

@Service // 서비스는 서비스 라고 어노테이션을 작성해주세요 @Repository,@Component 등도 사용가능하지만 서비스는 서비스로 사용하는게
			// 정석이고 직관적

public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDaoImpl dao; // 서비스는 dao에 접근하여 데이터를 가져오기때문에 dao연결하고 시작합니다.
	// 요청은 controller -> service -> dao 응답은 반대 생각하면 됩니다.

	@Autowired
	BCryptPasswordEncoder passEncoder;

	@Override // 회원가입
	public int memberJoin(Map<String, Object> member, MemberVO memberVO, HttpServletResponse response)
			throws Exception {// 똑같이 vo를 매개변수로 넣으면 get
		// set을 알아서해주기때문에 코드가
		// 줄어듦
		// 이거안쓰면 글씨 깨짐
		response.setContentType("text/html;charset=utf-8");

		// 아이디 중복을확인하여 1이면 가입을 못하게 막는다.
		if (dao.checkId(memberVO.getMem_Id()) == 1) {
			System.out.println("동일한 아이디");
			PrintWriter out = response.getWriter();
			response.setCharacterEncoding("utf-8");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('동일한 아이디가 있습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();

			return 0;

		} else {
			// 가입완료
			// memberVO.setForgot_key(create_key());
			//인증번호 생성
			
			memberVO.setMem_Key(create_key());
			member.put("mem_Key", memberVO.getMem_Key());
			dao.memberJoin(member);
			sendEmail(memberVO, "join");
			System.out.println("회원가입 완료");
			return 1;
		}

	}
	
	//이메일 인증 회원가입
	@Override
	public void approvalMember(MemberVO memberVO, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (dao.approvalMember(memberVO) == 0) { // 이메일 인증에 실패하였을 경우
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		} else { // 이메일 인증을 성공하였을 경우
			out.println("<script>");
			out.println("alert('인증이 완료되었습니다. 로그인 후 이용하세요.');");
			out.println("location.href='../member/loginPage';");
			out.println("</script>");
			out.close();
		}
	}
	

	@Override
	public void memberSearch(MemberVO memberVO) {
		// TODO Auto-generated method stub

	}

	// 로그인
	@Override
	public Map<String, Object> login(Map<String, Object> memLogin, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		//아이디가 없으면
		int checkId = dao.checkIdMap(memLogin);
		if (checkId == 0) {
			out.println("<script>");
			out.println("alert('등록된 아이디가 없습니다. 회원가입을 해주세요.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		
			
		//아이디가 있으면
		} else {
			MemberVO memStatus = dao.memberStatus(memLogin);
			if(!memStatus.getMem_Status().equals("true")){
			out.println("<script>");
			out.println("alert('이메일 인증 후 로그인 하세요.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
			}else {
				return dao.memberLogin(memLogin);
			}
			
			
		
	}
	}
	// 개인정보변경(이름만)
	@Override
	public MemberVO updateMypage(Map<String, Object> memberVO) throws Exception {
		dao.memberUpdate(memberVO);
		return dao.login(memberVO);
	}

	// 비밀번호변경
	@Override
	public MemberVO update_pw(Map<String, Object> memberVO, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		dao.update_pw(memberVO);
		return dao.loginCh(memberVO);
	}

	// 아이디 중복 검사(AJAX)
	@Override
	public int check_id(String mem_id) throws Exception {
		int result = dao.checkId(mem_id);
		return result;
	}

	// 인증키 생성
	@Override
	public String create_key() throws Exception {
		String key = "";
		Random rd = new Random();
		for (int i = 0; i < 8; i++) {
			key += rd.nextInt(10);
		}
		return key;
	}

	public void sendEmail(MemberVO memberVO, String div) throws Exception {
		System.out.println("11111111111" + memberVO.getMem_Name());

		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";

		// google 아이디, 비밀번호
		String hostSMTPid = "collawt@gmail.com";
		String hostSMTPpwd = "zhffkdnxl%!00";

		// 보내는 사람 EMail,이름, 제목, 내용
		String fromEmail = "collawt@gmail.com";
		String fromName = "CollawT 관리자";
		String subject = "";
		String msg = "";

		//회원가입시 인증메일
		if (div.equals("join")) {
			// 회원가입 메일 내용
			subject = "Collaw T 협업 회원가입 인증 메일입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += memberVO.getMem_Name() + "님 Collaw T 회원가입을 환영합니다.</h3>";
			msg += "<div style='font-size: 130%'>";
			msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
			msg += "<form method='post' action='http://localhost:8090/member/approvalMember'>";
			msg += "<input type='hidden' name='mem_Id' value='" + memberVO.getMem_Id() + "'>";
			msg += "<h1>" + memberVO.getMem_Id() + "<h1>";
			msg += "<input type='hidden' name='mem_Key' value='" + memberVO.getMem_Key() + "'>";
			msg += "<h1>" + memberVO.getMem_Key() +"<h1>";
			msg += "<input type='submit' value='인증'></form><br/></div>";

		} else if (div.equals("find_pw")) {
			subject = "CollawT 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += memberVO.getMem_Name() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += memberVO.getMem_Pwd() + "</p></div>";
		}
		// 받는 사람 E-Mail 주소
		String mail = memberVO.getMem_Id();
		System.out.println(mail);
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			// 네이버smtp 포트번호
			email.setSmtpPort(587);

			// 메일 아이디 비밀번호
			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			// 받는사람
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {

			System.out.println("메일발송 실패 : " + e);
		}
	}

	// 비밀번호찾기 이메일 보내기
	@Override
	public void find_pw(HttpServletResponse response, MemberVO memberVO, Map<String, Object> member) throws Exception {
		System.out.println("임시비밀번호 보내기!!");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 아이디가 없으면
		if (dao.checkId(memberVO.getMem_Id()) == 0) {
			out.print("<script>");
			out.println("alert('가입된 이메일이 아닙니다. 회원가입을 해주세요');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		} else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			String newPwd = passEncoder.encode(pw);

//			Map<String,Object> mem =new HashMap<String, Object>();
//			mem.put("mem_Name","콜라우티 회원");
//			mem.put("mem_Pwd", memberVO.setMem_Pwd(newPwd));
			memberVO.setMem_Pwd(newPwd);
			memberVO.setMem_Name("콜라우티회원");
			System.out.println("디비로갈것 : " + newPwd);
			// 비밀번호 변경
			dao.update_pw(memberVO);

			memberVO.setMem_Pwd(pw);
			System.out.println("이메일비번 " + memberVO.getMem_Pwd());

			// 비밀번호 변경 메일 발송
			sendEmail(memberVO, "find_pw");
			out.print("<script>");
			out.println("alert('이메일로 임시비밀번호를 전송하였습니다. 확인해 주세요!');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
	}

	// 회원탈퇴
	@Override
	public Map<String, Object> memberDelete(Map<String, Object> memberVO, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		System.out.println("service password: " + dao.memberLogin(memberVO));
		// 디비 비밀번호와 입력한 비밀번호가 다르다면

//		if (!pwd.equals(dao.loginC(memberVO.getMem_Id()).getMem_Pwd())) {
//			out.println("<script>");
//			out.println("alert('기존 비밀번호가 다릅니다.');");
//			out.println("history.go(-1);");
//			out.println("</script>");
//			out.close();
//			return null;
//		//비밀번호가 맞다면.
//		}else {
		dao.memberDelete(memberVO);
		return dao.memberLogin(memberVO);
		// }

	}

	@Override
	public List<Map> searchList(Map<String, Object> searchMap) throws Exception {
		// TODO Auto-generated method stub

		return dao.searchList(searchMap);
	}

	@Override
	public int memberJoin(Map<String, Object> member) throws Exception {
		dao.memberJoin(member);
		return 1;
	}

	@Override
	public int memberJoinApi(Map<String, Object> member) throws Exception {
		dao.memberJoinApi(member);
		return 1;
	}

	@Override
	public int memberJoinApiGoogle(Map<String, Object> member) throws Exception {
		dao.memberJoinApiGoogle(member);
		return 1;
	}

	@Override
	public MemberVO memberLoginNaver(Map<String, Object> memberVO) throws Exception {

		return null;
	}

}
