package project.euna.issue.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.euna.issue.dao.IssueDAOImpl;
import project.euna.issue.vo.Criteria;
import project.euna.issue.vo.IssueVO;
import project.euna.reply.vo.ReplyVO;
import project.notify.dao.NotifyDAOImpl;


@Service
public class IssueServiceImpl implements IssueService {
	
	@Autowired
	IssueDAOImpl issueDAO;
	
	@Inject
	NotifyDAOImpl notifyDAO;
	
	//
	
	//글 등록
	@Override
	public void  issueInsert(Map map) {
		int result = issueDAO.issueInsert(map);
		//notifyDAO.notifyInsert(map);
		
	}
	
	
	
	//목록 조회 페이징
	@Override
	public List<Map> searchList(Criteria cri) throws Exception{
		List<Map> list = issueDAO.searchList(cri);
		return list;
	}
	
	//게시물 총 갯수
	@Override
	public int listCount(String c_Id) throws Exception{
		return issueDAO.listCount(c_Id);
	}
	
	//게시글 조회
	@Override
	public Map<String, Object> issueRead(String i_Num) {
		return issueDAO.issueRead(i_Num);
		
	}

	//글 삭제
	@Override
	public void issueDelete(String i_Num) throws Exception {
		issueDAO.issueDelete(i_Num);
	}

	//글 수정
	@Override
	public void issueUpdate(IssueVO issueVO) throws Exception {
		issueDAO.issueUpdate(issueVO);
	}
	
	//이슈그룹 조회
	@Override
	public List<Map> igRead() {
		return issueDAO.igRead();
		
	}
	
	
	//협업공간 내 멤버 조회
	@Override
	public List<Map> comemRead(String c_id) {
		return issueDAO.comemRead(c_id);
		
	}
	
	//이슈 담당자 삽입
	@Override
	public void comemInsert(Map<String, Object> dataMap) throws Exception {
		// TODO Auto-generated method stub
		issueDAO.comemInsert(dataMap);
	}
	
	//협업공간 내 멤버 조회
	@Override
	public List<Map> chargerRead(String i_Num) {
		return issueDAO.chargerRead(i_Num);
		
	}
	
	//이슈 담당자 수정(삭제 후 다시 삽입)
	@Override
	public void chargerDelete(String i_Num) throws Exception {
		issueDAO.chargerDelete(i_Num);
	}
	
	
	//협업공간 조회
	//@Override
	public List<Map> coRead(String mem_id) {
		return issueDAO.coRead(mem_id);
		
	}
	
	//다른 협업공간으로 복사
	@Override
	public void  issueCopy(Map map) {
		int result = issueDAO.issueCopy(map);
		//notifyDAO.notifyInsert(map);
		
	}
	

}
