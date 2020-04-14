package project.euna.issue.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.euna.issue.vo.AppendixVO;
import project.euna.issue.vo.Criteria;
import project.euna.issue.vo.IssueVO;

@Repository
public class IssueDAOImpl implements IssueDAO {

	@Autowired
	private SqlSession sqlSession;

	// 글 입력
	@Override
	public int issueInsert(IssueVO issueVO) {
		int result;
		result = sqlSession.update("issue.issueInsert", issueVO);
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
	public int listCount() throws Exception {
		return sqlSession.selectOne("issue.listCount");
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

	// 실제파일첨부 테스트
	@Override
	public void saveFile(Map<String, Object> hmap) throws Exception {
		sqlSession.insert("issue.saveFile", hmap);
	}
	
	//파일 조회 리스트
	@Override
	public List<Map> fileList(String i_Num) throws DataAccessException {

		List<Map> list = sqlSession.selectList("issue.fileList", i_Num);
		return list;

	}
	
	//파일 다운로드
	@Override
	public Map<String, Object> download(String a_Num) {
		return sqlSession.selectOne("issue.download", a_Num);
	}


	//이미지 불러오기
//	public Map<String, Object> getByteImage(String mem_Id) { return
//	sqlSession.selectOne("member.getByteImage", mem_Id); }
	 

}
