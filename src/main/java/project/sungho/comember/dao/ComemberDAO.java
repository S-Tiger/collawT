package project.sungho.comember.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.sungho.comember.vo.ComemberVO;


public interface ComemberDAO {

	
	public List<ComemberVO> searchList(Map<String, Object> searchMap) throws DataAccessException; ;
	 
	 public void updateComember(Map<String, Object> dataMap) throws DataAccessException;
	 public void insertComember(Map<String, Object> datahMap) throws DataAccessException;
	 public void deleteComember(Map<String, Object> dataMap) throws DataAccessException;
}
