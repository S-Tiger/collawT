package project.euna.whole_search.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import project.euna.whole_search.dao.Whole_searchDAOImpl;
import project.euna.whole_search.vo.Criteria;
import project.euna.whole_search.vo.SearchVO;



@Service
public class Whole_searchServiceImpl implements Whole_searchService {
	
	@Inject
	Whole_searchDAOImpl whole_searchDAO;
	


	// 이슈 검색결과  페이징
	@Override
	public List<Map> searchIssue(Criteria cri) throws DataAccessException  {
		return whole_searchDAO.searchIssue(cri);
	
	}
	
	//이슈 검색결과 게시물 총 갯수
	@Override
	public int issueCount(Criteria cri) throws Exception{
		return whole_searchDAO.issueCount(cri);
	}
	
	
	// 파일 검색결과 페이징
	@Override
	public List<Map> searchFile(Criteria cri) throws DataAccessException  {
		return whole_searchDAO.searchFile(cri);
	
	}
	
	//파일 검색결과 게시물 총 갯수
	@Override
	public int fileCount(Criteria cri) throws Exception{
		return whole_searchDAO.fileCount(cri);
	}
	
	// 투표 검색결과 페이징
	@Override
	public List<Map> searchVote(Criteria cri) throws DataAccessException  {
		return whole_searchDAO.searchVote(cri);
	
	}
	
	//투표 검색결과 게시물 총 갯수
	@Override
	public int voteCount(Criteria cri) throws Exception{
		return whole_searchDAO.voteCount(cri);
	}
	
}
