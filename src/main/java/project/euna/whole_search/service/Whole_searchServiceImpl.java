package project.euna.whole_search.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import project.euna.whole_search.dao.Whole_searchDAOImpl;
import project.euna.whole_search.vo.Criteria;



@Service
public class Whole_searchServiceImpl implements Whole_searchService {
	
	@Inject
	Whole_searchDAOImpl whole_searchDAO;
	


	//전체 파일
	@Override
	public List<Map> search(String mem_Id) throws DataAccessException  {
		return whole_searchDAO.search(mem_Id);

}
}
