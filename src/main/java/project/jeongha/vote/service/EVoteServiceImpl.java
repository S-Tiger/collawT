package project.jeongha.vote.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.jeongha.vote.dao.EVoteDAO;
import project.jeongha.vote.dao.EVoteDAOImpl;
import project.jeongha.vote.vo.Criteria;
import project.notify.dao.NotifyDAOImpl;


@Service
public class EVoteServiceImpl implements EVoteService {
	
	@Autowired
	EVoteDAOImpl evoteDAO;
	
	@Inject
	NotifyDAOImpl notifyDAO;
	
	//
	
	//글 등록
	@Override
	public void  voteInsert(Map map) {
		int result = evoteDAO.voteInsert(map);
		System.out.println("!!!!!!!!!!!!!!!!!11cmap service"+map);
		
	}
	
	
	
	//목록 조회 페이징
	@Override
	public List<Map> searchList(Criteria cri) throws Exception{
		List<Map> list = evoteDAO.searchList(cri);
		return list;
	}
	
	//게시물 총 갯수
	@Override
	public int listCount(String c_Id) throws Exception{
		return evoteDAO.listCount(c_Id);
	}
	
	//게시글 조회
	@Override
	public Map<String, Object> issueRead(String i_Num) {
		return evoteDAO.issueRead(i_Num);
		
	}

	//글 삭제
	@Override
	public void issueDelete(String i_Num) throws Exception {
		evoteDAO.issueDelete(i_Num);
	}

	//글 수정
//	@Override
//	public void issueUpdate(IssueVO issueVO) throws Exception {
//		evoteDAO.issueUpdate(issueVO);
//	}
	
	//이슈그룹 조회
	@Override
	public List<Map> igRead() {
		return evoteDAO.igRead();
		
	}
	
	
	//협업공간 내 멤버 조회
	@Override
	public List<Map> comemRead(String c_id) {
		return evoteDAO.comemRead(c_id);
		
	}
	
	//이슈 담당자 삽입
	@Override
	public void comemInsert(Map<String, Object> dataMap) throws Exception {
		// TODO Auto-generated method stub
		evoteDAO.comemInsert(dataMap);
	}
	
	//협업공간 내 멤버 조회
	@Override
	public List<Map> chargerRead(String i_Num) {
		return evoteDAO.chargerRead(i_Num);
		
	}
	
	//이슈 담당자 수정(삭제 후 다시 삽입)
	@Override
	public void chargerDelete(String i_Num) throws Exception {
		evoteDAO.chargerDelete(i_Num);
	}
	
	
	//협업공간 조회
	//@Override
//	public List<Map> coRead(String mem_id) {
//		return evoteDAO.coRead(mem_id);
//		
//	}
	

}