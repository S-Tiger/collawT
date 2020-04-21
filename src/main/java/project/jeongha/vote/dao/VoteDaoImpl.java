package project.jeongha.vote.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VoteDaoImpl implements VoteDao{

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public int voteInsert(Map<String, Object> v_Info) {
		int result = sqlSession.insert("vote.voteInsert", v_Info);
		return result;
	}

}
