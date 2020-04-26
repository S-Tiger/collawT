package project.euna.personal_search.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.euna.personal_search.vo.Criteria;


@Repository
public class Personal_searchDAOImpl implements Personal_searchDAO {

	@Inject
	private SqlSession sqlSession;


	// 내가쓴 글 목록 페이징
	@Override
	public List<Map> myBoardlist(Criteria cri) throws DataAccessException {

		List<Map> list = sqlSession.selectList("personal_search.myBoardlist", cri);
		return list;

	}

	// 내가쓴 글 게시물 총 갯수
	@Override
	public int myBoardlistCount(String mem_Id) throws Exception {
		return sqlSession.selectOne("personal_search.listCount", mem_Id);
	}



	// 글 삭제
//	@Override
//	public void issueDelete(String i_Num) throws Exception {
//		sqlSession.delete("issue.issueDelete", i_Num);
//
//	}
	
	
	//전체 파일
	@Override
	public List<Map> myFile(String mem_Id) throws DataAccessException {

		List<Map> list = sqlSession.selectList("personal_search.myFile", mem_Id);
		return list;

	}


	
}
