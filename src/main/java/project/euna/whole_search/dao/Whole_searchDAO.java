package project.euna.whole_search.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;


public interface Whole_searchDAO {
//
	public List<Map> search(String mem_Id) throws DataAccessException;

}
