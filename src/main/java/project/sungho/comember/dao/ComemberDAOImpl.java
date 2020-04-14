package project.sungho.comember.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.sungho.comember.vo.ComemberVO;



@Repository 
public class ComemberDAOImpl implements ComemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Map> searchList(Map<String, Object> searchMap) throws DataAccessException {
		// TODO Auto-generated method stub
		List<Map> list = sqlSession.selectList("comember.searchList", searchMap); 
		//맵퍼에 cowork.searchList 를 찾아 실행 

		return list;
	}

	@Override
	public void updateComember(Map<String, Object> dataMap) throws DataAccessException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertComember(Map<String, Object> dataMap) throws DataAccessException {
		
		sqlSession.update("comember.insertComember",dataMap);
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteComember(Map<String, Object> dataMap) throws DataAccessException {
		// TODO Auto-generated method stub
		sqlSession.delete("comember.deleteComember",dataMap);
	}
	
	public void deleteComemberAll(Map<String, Object> dataMap) throws DataAccessException {
		// TODO Auto-generated method stub
		sqlSession.delete("comember.deleteComemberAll",dataMap);
		
	}
	
	
}
