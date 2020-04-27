package project.euna.whole_search.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.euna.whole_search.vo.SearchVO;


public interface Whole_searchDAO {
//
	public List<Map> searchIssue(SearchVO searchVO) throws DataAccessException;

}
