package project.sungho.apply.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.RequestParam;

import project.sungho.apply.vo.ApplyVO;


public interface ApplyDAO {

	
	public List<ApplyVO> searchList(Map<String, Object> searchMap) throws DataAccessException; ;
	 
	 public void updateApply(Map<String, Object> dataMap) throws DataAccessException;
	 public void insertApply(Map<String, Object> dataMap) throws DataAccessException;
	 public void deleteApply(Map<String, Object> dataMap) throws DataAccessException;
	 
	 public int memberCheck(String mem_Id) throws Exception;
}