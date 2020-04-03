package project.comember.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.comember.vo.ComemberVO;



@Repository 
public class ComemberDAOImpl implements ComemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ComemberVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateComember(Map<String, Object> dataMap) throws DataAccessException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertComember(Map<String, Object> datahMap) throws DataAccessException {
		
		sqlSession.update("comember.insertComember",datahMap);
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteComember(Map<String, Object> dataMap) throws DataAccessException {
		// TODO Auto-generated method stub
		
	}
	
}
