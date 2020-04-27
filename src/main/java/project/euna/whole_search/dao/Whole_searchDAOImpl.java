package project.euna.whole_search.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.euna.whole_search.vo.Criteria;



@Repository
public class Whole_searchDAOImpl implements Whole_searchDAO {

	@Inject
	private SqlSession sqlSession;


	
	//전체 이슈 페이징
	@Override
	public List<Map> search(String mem_Id) throws DataAccessException {

		List<Map> list = sqlSession.selectList("whole_search.searchIssue", mem_Id);
		return list;

	}

	
}
