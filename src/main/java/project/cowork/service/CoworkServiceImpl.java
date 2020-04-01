package project.cowork.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import project.cowork.dao.CoworkDAO;
import project.cowork.vo.CoworkVO;
import project.hm.hmp001_d001.vo.Hmp001_d001VO;


@Service //서비스는 서비스 어노테이션을 작성해준다 
public class CoworkServiceImpl implements CoworkService {
	
	@Autowired //DAO객체를 메모리에 올려하는 어노테이션 new랑 같음
	private CoworkDAO coworkDAO; 
	
	@Override
	public List<CoworkVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		
		List<CoworkVO> list =  coworkDAO.searchList(searchMap);  //DAO에 searchList함수 실행
		return list;
	}

	@Override
	public void updateCowork(Map<String, Object> dataMap) throws Exception {
		
	}

	@Override
	public void insertCowork(CoworkVO coworkVO) throws Exception {
		
		coworkDAO.insertCowork(coworkVO);//DAO에 insertCowork함수 실행
		
	}

	@Override
	public void deleteCowork(Map<String, Object> dataMap) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
