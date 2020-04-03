package project.issue.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
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
	public List<Map> searchList() throws DataAccessException{
		
		List<Map> list = sqlSession.selectList("issue.searchList");
		return list;
	
	}
	
	//������ ��ȸ
	@Override
	public List<Map> issueRead(String i_Num) {
		List<Map> list = null;
		list = sqlSession.selectList("issue.issueRead",i_Num);
		return list;
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
