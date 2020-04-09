package project.notify.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.euna.issue.vo.IssueVO;
import project.notify.vo.NotifyVO;

@Repository
public class NotifyDAOImpl implements NotifyDAO {
	IssueVO issueVO;

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int notifyInsert(IssueVO issueVO) {
		int result;
		result = sqlSession.update("notify.notifyInsert", issueVO);
		return result;
	}

	@Override
	public List<NotifyVO> searchNotify(Map<String, Object> searchMap) {
		// TODO Auto-generated method stub
		List<NotifyVO> list = sqlSession.selectList("notify.searchNotify", searchMap);
		return list;
	}

	@Override
	public int notifyUpdate(NotifyVO notifyVO) {
		int result ;
		result = sqlSession.update("notify.notifyUpdate",notifyVO);
		System.out.println("DAO:"+ notifyVO);
		// TODO Auto-generated method stub
		return result;
	}

	@Override
	public int viewNotify(int str) {
		int ddview = sqlSession.selectOne("notify.viewNoti", str);
		return ddview;
	}
	


}
