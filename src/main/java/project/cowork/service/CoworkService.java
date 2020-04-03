package project.cowork.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.cowork.vo.CoworkVO;


public interface CoworkService {
	 public List<CoworkVO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 
	 public void updateCowork(Map<String, Object> dataMap) throws Exception;
	 public void insertCowork(Map<String, Object> datahMap) throws Exception;
	 public void deleteCowork(Map<String, Object> dataMap) throws Exception;
}
