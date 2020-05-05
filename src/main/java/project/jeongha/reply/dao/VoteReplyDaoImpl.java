package project.jeongha.reply.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.jeongha.reply.vo.VoteReplyVO;

@Repository
public class VoteReplyDaoImpl  implements VoteReplyDao{

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List<Map> searchList(String v_Num) throws DataAccessException {
		
		List<Map> list = sqlSession.selectList("voteReply.searchList",v_Num);
		System.out.println("dao:"+list);
		return list;
	}

	@Override
	public int replyInsert(VoteReplyVO voteReplyVO) {
		int result;
		result = sqlSession.update("voteReply.replyInsert", voteReplyVO);
		//sqlSession.update("notify.replyInsertNotify",voteReplyVO);
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!dao :"+voteReplyVO.getC_Id());
		return result;
	}

	@Override
	public void replyDelete(VoteReplyVO voteReplyVO) throws Exception {
		sqlSession.delete("voteReply.replyDelete", voteReplyVO);
	}

	@Override
	public void replyUpdate(VoteReplyVO voteReplyVO) throws Exception {
		sqlSession.update("voteReply.replyUpdate", voteReplyVO);
		
	}

}
