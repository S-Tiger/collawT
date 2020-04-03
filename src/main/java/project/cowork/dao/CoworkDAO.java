package project.cowork.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.cowork.vo.CoworkVO;

public interface CoworkDAO {
	 public List<CoworkVO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 
	 public void updateCowork(Map<String, Object> dataMap) throws DataAccessException;
	 public void insertCowork(Map<String, Object> dataMap) throws DataAccessException;
	 public void deleteCowork(Map<String, Object> dataMap) throws DataAccessException;
	 
	 public String selectSqc() throws DataAccessException;;

}
