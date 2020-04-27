package project.euna.whole_search.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import project.euna.whole_search.dao.Whole_searchDAOImpl;
import project.euna.whole_search.vo.Criteria;
import project.euna.whole_search.vo.SearchVO;



@Service
public class Whole_searchServiceImpl implements Whole_searchService {
	
	@Inject
	Whole_searchDAOImpl whole_searchDAO;
	


	// 이슈 페이징
	@Override
	public List<Map> searchIssue(SearchVO searchVO) throws DataAccessException  {
		return whole_searchDAO.searchIssue(searchVO);

}
}
