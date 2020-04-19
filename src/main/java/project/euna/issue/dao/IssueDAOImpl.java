package project.euna.issue.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.euna.issue.vo.Criteria;
import project.euna.issue.vo.IssueVO;

@Repository
public class IssueDAOImpl implements IssueDAO {

	@Autowired
	private SqlSession sqlSession;

	// 글 입력
	@Override
	public int issueInsert(Map map) {
		int result;
		result = sqlSession.update("issue.issueInsert", map);
		return result;
	}

	// 글 목록 페이징
	@Override
	public List<Map> searchList(Criteria cri) throws DataAccessException {

		List<Map> list = sqlSession.selectList("issue.searchList", cri);
		return list;

	}

	// 게시물 총 갯수
	@Override
	public int listCount(String c_Id) throws Exception {
		return sqlSession.selectOne("issue.listCount", c_Id);
	}

	// 게시글 조회
	@Override
	public Map<String, Object> issueRead(String i_Num) {
		return sqlSession.selectOne("issue.issueRead", i_Num);

	}

	// 글 삭제
	@Override
	public void issueDelete(String i_Num) throws Exception {
		sqlSession.delete("issue.issueDelete", i_Num);

	}

	// 글 수정
	@Override
	public void issueUpdate(IssueVO issueVO) throws Exception {
		sqlSession.update("issue.issueUpdate", issueVO);
	}
	
	// 이슈그룹 조회
	@Override
	public List<Map> igRead() {
		return sqlSession.selectList("issue.igRead");

	}
	
	// 협업공간 조회
//	@Override
//	public List<Map> coRead(String mem_id) {
//		return sqlSession.selectList("issue.coRead", mem_id);
//
//	}

	
	//글쓰기 화면 전환 시 글번호 가져오기
//	@Override
//	public Map<String, Object> get_i_Num() {
//		return sqlSession.selectOne("issue.get_i_Num");
//	}
	


	//이미지 불러오기
//	public Map<String, Object> getByteImage(String mem_Id) { return
//	sqlSession.selectOne("member.getByteImage", mem_Id); }
	 

}
