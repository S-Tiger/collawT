package project.member.service;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import project.member.dao.MemberDaoImpl;
import project.member.vo.MemberVO;


@Service //서비스는 서비스 라고 어노테이션을 작성해주세요 @Repository,@Component 등도 사용가능하지만 서비스는 서비스로 사용하는게 정석이고 직관적

public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDaoImpl dao; //서비스는 dao에 접근하여 데이터를 가져오기때문에  dao연결하고 시작합니다.
	                   //요청은 controller -> service -> dao 응답은 반대 생각하면 됩니다.
	
	@Override//회원가입
	public void memberJoin(MemberVO memberVO) {//똑같이 vo를 매개변수로 넣으면 get set을 알아서해주기때문에 코드가 줄어듦
		int result = dao.memberInsert(memberVO); 
		
		if (result == 0) {
			System.out.println("Join Fail!!");
		} else {
			System.out.println("Join Success!!");
		}
		
	}

	@Override
	public void memberSearch(MemberVO memberVO) {
		// TODO Auto-generated method stub
		
	}

	//로그인
	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		
		return dao.memberSelect(memberVO);
	}
	
	//회원정보 업데이트(아직안씀)
	@Override
	public int memberUpdate(MemberVO memberVO) {
		// TODO Auto-generated method stub
		int result = dao.memberUpdate(memberVO); 
		if (result == 0) {
			System.out.println("Update Fail!!");
		} else {
			System.out.println("Update Success!!");
		}
		return result;
	}

	//개인정보변경(이름만)
	@Override
	public MemberVO updateMypage(MemberVO memberVO) throws Exception {
		dao.memberUpdate(memberVO);
		return dao.login(memberVO.getMem_Id());
	}

	//비밀번호변경
	@Override
	public MemberVO update_pw(MemberVO member, String old_pw, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(!old_pw.equals(dao.login(member.getMem_Id()).getMem_Pwd())) {
			out.println("<script>");
			out.println("alert('기존 비밀번호가 다릅니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		}else {
			dao.memberUpdate(member);
			return dao.login(member.getMem_Id());
		}
	}

	
	
	// 아이디 중복 검사(AJAX)
	@Override
	public void check_id(String mem_id, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		System.out.println(dao.check_id(mem_id));
		out.println(dao.check_id(mem_id));
		out.close();
	}

	





}
