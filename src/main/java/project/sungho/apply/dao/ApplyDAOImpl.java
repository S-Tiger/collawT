package project.sungho.apply.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.sungho.apply.vo.ApplyVO;



@Repository 
public class ApplyDAOImpl implements ApplyDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ApplyVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateApply(Map<String, Object> dataMap) throws DataAccessException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertApply(Map<String, Object> dataMap) throws DataAccessException {
		
		sqlSession.update("apply.insertApply",dataMap);
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteApply(Map<String, Object> dataMap) throws DataAccessException {
		// TODO Auto-generated method stub
		sqlSession.delete("apply.deleteApply",dataMap);
	}
	

	@Override
	public int memberCheck(String mem_Id) throws Exception {
		// TODO Auto-generated method stub
		int result;
		result = sqlSession.selectOne("apply.memberCheck",mem_Id);
		return result;
	}
	
	
}