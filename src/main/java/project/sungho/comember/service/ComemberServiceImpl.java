package project.sungho.comember.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import project.sungho.comember.dao.ComemberDAO;
import project.sungho.comember.vo.ComemberVO;



@Service
public class ComemberServiceImpl implements ComemberService{
	
	@Autowired
	ComemberDAO comemberDAO;

	@Override
	public List<Map> searchList(Map<String, Object> searchMap) throws DataAccessException {
		// TODO Auto-generated method stub
		List<Map> list =  comemberDAO.searchList(searchMap);  //DAO에 searchList함수 실행
		return list;
	}

	@Override
	public void updateComember(Map<String, Object> dataMap) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertComember(Map<String, Object> dataMap) throws Exception {
		comemberDAO.insertComember(dataMap);
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteComember(Map<String, Object> dataMap) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
