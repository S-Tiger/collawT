package project.jeongha.vote.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.jeongha.vote.vo.VoteVO;

@Repository
public class VoteDaoImpl implements VoteDao{

	@Autowired
	private SqlSession sqlSession;
	
	//투표 내용
	@Override
	public int voteInsert(Map<String, Object> v_Info) {
		int result = sqlSession.insert("vote.voteInsert", v_Info);
		return result;
	}

	//투표 보기목록들 넣기
	@Override
	public int votedInsert(Map<String, Object> vd_Info) {
		int result = sqlSession.insert("vote.votedInsert", vd_Info);
		return result;
	}

	
	//투표 리스트
	@Override
	public List<Map> voteList() throws Exception {
		return sqlSession.selectList("vote.voteList");
	}

	//투표 보기 리스트
	@Override
	public List<Map> votedList() throws Exception {
		List<Map> votedList = sqlSession.selectList("vote.votedList");
		return votedList;
	}
	
	

}