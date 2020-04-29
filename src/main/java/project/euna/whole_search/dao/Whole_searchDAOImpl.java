package project.euna.whole_search.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.euna.whole_search.vo.Criteria;



@Repository
public class Whole_searchDAOImpl implements Whole_searchDAO {

	@Inject
	private SqlSession sqlSession;


	
	//전체 이슈 검색결과 페이징
	@Override
	public List<Map> searchIssue(Criteria cri) throws DataAccessException {

		List<Map> list = sqlSession.selectList("whole_search.searchIssue", cri);
		return list;

	}
	
	// 이슈 검색결과 총 갯수
	@Override
	public int issueCount(Criteria cri) throws Exception {
		return sqlSession.selectOne("whole_search.issueCount", cri);
	}
	
	//전체 파일 검색결과 페이징
	@Override
	public List<Map> searchFile(Criteria cri) throws DataAccessException {

		List<Map> list = sqlSession.selectList("whole_search.searchFile", cri);
		return list;

	}
	
	//파일 검색결과 총 갯수
	@Override
	public int fileCount(Criteria cri) throws Exception {
		return sqlSession.selectOne("whole_search.fileCount", cri);
	}
	
	
	//전체 투표 검색결과 페이징
	@Override
	public List<Map> searchVote(Criteria cri) throws DataAccessException {

		List<Map> list = sqlSession.selectList("whole_search.searchVote", cri);
		return list;

	}
	
	//파일 검색결과 총 갯수
	@Override
	public int voteCount(Criteria cri) throws Exception {
		return sqlSession.selectOne("whole_search.voteCount", cri);
	}
	
	
	//전체 투표 검색결과 페이징
	@Override
	public List<Map> searchReply(Criteria cri) throws DataAccessException {

		List<Map> list = sqlSession.selectList("whole_search.searchReply", cri);
		return list;

	}
	
	//파일 검색결과 총 갯수
	@Override
	public int replyCount(Criteria cri) throws Exception {
		return sqlSession.selectOne("whole_search.replyCount", cri);
	}

	
}
