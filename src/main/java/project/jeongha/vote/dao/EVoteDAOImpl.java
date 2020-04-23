package project.jeongha.vote.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.jeongha.vote.vo.Criteria;


@Repository
public class EVoteDAOImpl implements EVoteDAO {
//
	@Autowired
	private SqlSession sqlSession;

	// 글 입력
	@Override
	public int voteInsert(Map map) {
		int result;
		result = sqlSession.update("voteResult.voteInsert", map);
//		 sqlSession.selectOne("voteResult.voteInsert", map);
		return result;
	}
	//항목들 입력
	@Override
	public int votedInsert(Map map) {
		int result = sqlSession.insert("voteResult.votedInsert", map);
		return result;
	}
	
	
	// 글 목록 페이징
	@Override
	public List<Map> searchList(Criteria cri) throws DataAccessException {

		List<Map> list = sqlSession.selectList("voteResult.searchList", cri);
		return list;

	}

	// 게시물 총 갯수
	@Override
	public int listCount(String c_Id) throws Exception {
		return sqlSession.selectOne("voteResult.listCount", c_Id);
	}

	// 게시글 조회
	@Override
	public Map<String, Object> voteRead(String v_Num) {
		return sqlSession.selectOne("voteResult.voteRead", v_Num);

	}

	// 글 삭제
	@Override
	public void voteDelete(String i_Num) throws Exception {
		sqlSession.delete("voteResult.issueDelete", i_Num);

	}

	// 글 수정
//	@Override
//	public void issueUpdate(IssueVO issueVO) throws Exception {
//		sqlSession.update("voteResult.issueUpdate", issueVO);
//	}
	
	// 이슈그룹 조회
	@Override
	public List<Map> igRead() {
		return sqlSession.selectList("voteResult.igRead");

	}
	
	//협업공간 내 멤버 조회
	@Override
	public List<Map> comemRead(String c_id) {
		return sqlSession.selectList("voteResult.comemRead", c_id);

	}
	
	//이슈 담당자 삽입
	@Override
	public void comemInsert(Map<String, Object> dataMap) throws DataAccessException {
		
		sqlSession.update("voteResult.comemInsert",dataMap);
		
		// TODO Auto-generated method stub
		
	}
	
	//이슈 담당자 조회
	@Override
	public List<Map> chargerRead(String i_Num) {
		return sqlSession.selectList("issue.chargerRead", i_Num);
	}
	
	//이슈 담당자 수정(삭제 후 다시 삽입)
	@Override
	public void chargerDelete(String i_Num) throws Exception {
		sqlSession.delete("issue.chargerDelete", i_Num);

	}
	//v_num가져오기
	@Override
	public Map<String, Object> voteInfo(Map<String, Object> voteInfo) throws Exception {
		Map<String, Object> result = sqlSession.selectOne("voteResult.v_num", voteInfo);
		return result;
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
