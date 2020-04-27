package project.euna.whole_search.service;


import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.euna.whole_search.vo.Criteria;



public interface Whole_searchService {

	public List<Map> search(String mem_Id) throws DataAccessException;

}
