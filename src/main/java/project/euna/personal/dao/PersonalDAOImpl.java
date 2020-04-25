package project.euna.personal.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.euna.personal.vo.Criteria;
import project.euna.personal.vo.PersonalVO;

@Repository
public class PersonalDAOImpl implements PersonalDAO {
//
	@Autowired
	private SqlSession sqlSession;

	// 글 입력
	@Override
	public int personalInsert(Map map) {
		int result;
		result = sqlSession.update("personal.personalInsert", map);
		return result;
	}

	// 글 목록 페이징
	@Override
	public List<Map> searchList(Criteria cri) throws DataAccessException {

		List<Map> list = sqlSession.selectList("personal.searchList", cri);
		return list;

	}

	// 게시물 총 갯수
	@Override
	public int listCount(String c_Id) throws Exception {
		return sqlSession.selectOne("personal.listCount", c_Id);
	}

	// 게시글 조회
	@Override
	public Map<String, Object> personalRead(String i_Num) {
		return sqlSession.selectOne("personal.personalRead", i_Num);

	}

	// 글 삭제
	@Override
	public void personalDelete(String i_Num) throws Exception {
		sqlSession.delete("personal.personalDelete", i_Num);

	}

	// 글 수정
	@Override
	public void personalUpdate(PersonalVO personalVO) throws Exception {
		sqlSession.update("personal.personalUpdate", personalVO);
	}
	
	// 이슈그룹 조회
	@Override
	public List<Map> igRead() {
		return sqlSession.selectList("personal.igRead");

	}
	
	//협업공간 내 멤버 조회
	@Override
	public List<Map> comemRead(String c_id) {
		return sqlSession.selectList("personal.comemRead", c_id);

	}
	
	//이슈 담당자 삽입
	@Override
	public void comemInsert(Map<String, Object> dataMap) throws DataAccessException {
		
		sqlSession.update("personal.comemInsert",dataMap);
		
		// TODO Auto-generated method stub
		
	}
	
	//이슈 담당자 조회
	@Override
	public List<Map> chargerRead(String i_Num) {
		return sqlSession.selectList("personal.chargerRead", i_Num);
	}
	
	//이슈 담당자 수정(삭제 후 다시 삽입)
	@Override
	public void chargerDelete(String i_Num) throws Exception {
		sqlSession.delete("personal.chargerDelete", i_Num);

	}
	
	
	//글쓰기 화면 전환 시 글번호 가져오기
	@Override
	public Map<String, Object> get_i_Num() {
		return sqlSession.selectOne("personal.get_i_Num");
	}

	


	//이미지 불러오기
//	public Map<String, Object> getByteImage(String mem_Id) { return
//	sqlSession.selectOne("member.getByteImage", mem_Id); }
	 
	// 협업공간 조회
	@Override
	public List<Map> coRead(String mem_id) {
		return sqlSession.selectList("personal.coRead", mem_id);

	}
	
	// 다른 협업공간으로 복사
	@Override
	public int personalCopy(Map map) {
		int result;
		result = sqlSession.update("personal.personalCopy", map);
		return result;
	}
	
	//글 목록 조회 시  이슈 담당자 화면에 뿌리기 용
	@Override
	public List<Map> chargerList(String c_Id) {
		return sqlSession.selectList("personal.chargerList", c_Id);
	}
	
}