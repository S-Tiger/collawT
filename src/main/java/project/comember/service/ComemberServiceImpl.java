package project.comember.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import project.comember.dao.ComemberDAO;
import project.comember.vo.ComemberVO;



@Service
public class ComemberServiceImpl implements ComemberService{
	
	@Autowired
	ComemberDAO comemberDAO;

	@Override
	public List<ComemberVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateComember(Map<String, Object> dataMap) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertComember(Map<String, Object> dataMap) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteComember(Map<String, Object> dataMap) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
