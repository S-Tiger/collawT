package project.comember.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.comember.vo.ComemberVO;



public interface ComemberService {
	public List<ComemberVO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 
	 public void updateComember(Map<String, Object> dataMap) throws Exception;
	 public void insertComember(Map<String, Object> dataMap) throws Exception;
	 public void deleteComember(Map<String, Object> dataMap) throws Exception;
}
