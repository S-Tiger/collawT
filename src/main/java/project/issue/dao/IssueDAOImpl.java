package project.issue.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import project.issue.vo.IssueVO;

@Repository
public class IssueDAOImpl implements issueDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int issueInsert(IssueVO issueVO) {
		int result;
		result = sqlSession.update("issue.issueInsert", issueVO);
		return result;
	}

	@Override
	public List<IssueVO> searchList(Map<String, Object> searchMap) {
		List<IssueVO> list = sqlSession.selectList("issue.searchList", searchMap);
		return list;
		
	}

}
