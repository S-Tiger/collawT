package project.sample.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import project.sample.vo.MemberVO;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSession sqlSesssion; //맵퍼에 접근하기위한 SQL세션
	

	@Override
	public int memberInsert(MemberVO memberVO) {
		// TODO Auto-generated method stub
		int stat = sqlSesssion.update("sample.insertMember", memberVO); //맵퍼실행문 sqlSession.update 
													//을 통해 데이터 변경 및 삽입 삭제은 update를 사용 sample.insertMember는
													//맵퍼 키값입니다 해당하는 sql문 실행 밑 데이터를 가져옵니다
													//sqlSession.selectList("맵퍼키값",데이터)는 해당하는 
													//데이터를 가져올떄 사용합니다. 
		
		return stat;
	}

	@Override
	public MemberVO memberSelect(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return null;
	}

	


}