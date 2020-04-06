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
//	
//	
//	
//	//게시글 조회
//	@Override
//	public Map<String, Object> issueRead(String i_Num) {
//		return sqlSession.selectOne("issue.issueRead",i_Num);
//		
//	}
//
//	//글 삭제
//	@Override
//	public void issueDelete(String i_Num) throws Exception {
//		sqlSession.delete("issue.issueDelete", i_Num);
//		
//	}
//	
//	//글 수정
//	@Override
//	public void issueUpdate(IssueVO issueVO) throws Exception {
//		sqlSession.update("issue.issueUpdate", issueVO);
//	}

}
