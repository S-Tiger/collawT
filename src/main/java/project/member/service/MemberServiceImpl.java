package project.member.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import project.member.dao.MemberDaoImpl;
import project.member.vo.MemberVO;


@Service //서비스는 서비스 라고 어노테이션을 작성해주세요 @Repository,@Component 등도 사용가능하지만 서비스는 서비스로 사용하는게 정석이고 직관적

public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDaoImpl dao; //서비스는 dao에 접근하여 데이터를 가져오기때문에  dao연결하고 시작합니다.
	                   //요청은 controller -> service -> dao 응답은 반대 생각하면 됩니다.
	
	@Override//회원가
	public void memberRegister(MemberVO memberVO) {//똑같이 vo를 매개변수로 넣으면 get set을 알아서해주기때문에 코드가 줄어듦
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

	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		
		return dao.memberSelect(memberVO);
	}

	@Override//회원정보 업데이
	public void memberUpdate(MemberVO memberVO) {
		// TODO Auto-generated method stub
		int result = dao.memberUpdate(memberVO); 
		if (result == 0) {
			System.out.println("Update Fail!!");
		} else {
			System.out.println("Update Success!!");
		}
	}




	

	


}
