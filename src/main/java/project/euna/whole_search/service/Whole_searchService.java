package project.euna.whole_search.service;


import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.euna.whole_search.vo.Criteria;
import project.euna.whole_search.vo.SearchVO;



public interface Whole_searchService {

	public List<Map> searchIssue(Criteria cri) throws DataAccessException;
	public int issueCount(Criteria cri) throws Exception;
}
