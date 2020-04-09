package project.euna.reply.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.euna.reply.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	//댓글 목록
		@Override
		public List<Map> searchList(String i_Num) throws DataAccessException{
			
			List<Map> list = sqlSession.selectList("reply.searchList",i_Num);
			System.out.println("dao:"+list);
			return list;
		
		}
		
		
	//글 입력
	@Override
	public int replyInsert(ReplyVO replyVO) {
		int result;
		result = sqlSession.update("reply.replyInsert", replyVO);
		return result;
	}


	//댓글 삭제
	@Override
	public void replyDelete(ReplyVO replyVO) throws Exception {
		sqlSession.delete("reply.replyDelete", replyVO);
		
	}
	
	//댓글 수정
	@Override
	public void replyUpdate(ReplyVO replyVO) throws Exception {
		sqlSession.update("reply.replyUpdate", replyVO);
	}
	
}
