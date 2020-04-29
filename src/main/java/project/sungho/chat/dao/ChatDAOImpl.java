package project.sungho.chat.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDAOImpl implements ChatDAO{
	
	@Autowired //DB접속을 자동주입을 받고 맵퍼를 연결한다.
	private SqlSession sqlSession;

	@Override
	public List<Map> searchList(Map<String, Object> searchMap) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateChat(Map<String, Object> dataMap) throws DataAccessException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertChat(Map<String, Object> dataMap) throws DataAccessException {
		sqlSession.insert("chat.insertChat",dataMap);
	}
	
	@Override
	public void logoutinsertChat(Map<String, Object> dataMap) throws DataAccessException {
		sqlSession.insert("chat.logoutinsertChat",dataMap);
	}

	@Override
	public int deleteChat(Map<String, Object> dataMap) throws DataAccessException {
		// TODO Auto-generated method stub
		return 0;
	}

}
