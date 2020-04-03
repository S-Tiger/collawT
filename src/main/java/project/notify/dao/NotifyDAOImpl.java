package project.notify.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.notify.vo.NotifyVO;

@Repository
public class NotifyDAOImpl implements NotifyDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int notifyInsert(NotifyVO notifyVO) {
		int result;
		result = sqlSession.update("notify.notifyInsert", notifyVO);
		return result;
	}
	


}