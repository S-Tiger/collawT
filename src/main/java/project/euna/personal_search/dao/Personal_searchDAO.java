package project.euna.personal_search.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.euna.personal_search.vo.Criteria;


public interface Personal_searchDAO {
//
	public List<Map> myBoardlist(Criteria cri) throws DataAccessException;
	public int myBoardlistCount(String mem_Id) throws Exception;

}