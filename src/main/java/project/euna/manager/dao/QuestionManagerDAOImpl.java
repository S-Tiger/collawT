package project.euna.manager.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.hm.hmp002_d001.vo.Hmp002_d001VO;


@Repository
public class QuestionManagerDAOImpl implements QuestionManagerDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Map> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<Map> list = sqlSession.selectList("questionmanager.searchList", searchMap);
		return list;
	}

	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("questionmanager.insertData", row);
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("questionmanager.updateData", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("questionmanager.deleteData", row);
	}
	
	@Override
	public Map<String, Object> questionRead(String q_Num) throws DataAccessException {
		Map<String, Object> list = sqlSession.selectOne("questionmanager.questionRead", q_Num);
		return list;
	}


}
