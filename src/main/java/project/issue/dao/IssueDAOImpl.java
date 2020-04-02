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
	
	//�� �Է�
	@Override
	public int issueInsert(IssueVO issueVO) {
		int result;
		result = sqlSession.update("issue.issueInsert", issueVO);
		return result;
	}
	
	//�� ��� ��ȸ
	@Override
	public List<IssueVO> searchList(Map<String, Object> searchMap) {
		List<IssueVO> list = sqlSession.selectList("issue.searchList", searchMap);
		return list;
		
	}
	
	//������ ��ȸ
	@Override
	public IssueVO issueRead(String i_Num) {

		return sqlSession.selectOne("issue.issueRead",i_Num);
	}

	//�� ����
	@Override
	public void issueDelete(String i_Num) throws Exception {
		sqlSession.delete("issue.issueDelete", i_Num);
		
	}
	
	//�� ����
	@Override
	public void issueUpdate(IssueVO issueVO) throws Exception {
		sqlSession.update("issue.issueUpdate", issueVO);
	}

}
