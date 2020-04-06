package project.issue.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.issue.vo.IssueVO;

@Repository
public class IssueDAOImpl implements IssueDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	//글 입력
	@Override
	public int issueInsert(IssueVO issueVO) {
		int result;
		result = sqlSession.update("issue.issueInsert", issueVO);
		return result;
	}
	
	//글 목록
	@Override
	public List<Map> searchList() throws DataAccessException{
		
		List<Map> list = sqlSession.selectList("issue.searchList");
		return list;
	
	}
	
	//게시글 조회
	@Override
	public Map<String, Object> issueRead(String i_Num) {
		return sqlSession.selectOne("issue.issueRead",i_Num);
		
	}

	//글 삭제
	@Override
	public void issueDelete(String i_Num) throws Exception {
		sqlSession.delete("issue.issueDelete", i_Num);
		
	}
	
	//글 수정
	@Override
	public void issueUpdate(IssueVO issueVO) throws Exception {
		sqlSession.update("issue.issueUpdate", issueVO);
	}

}
