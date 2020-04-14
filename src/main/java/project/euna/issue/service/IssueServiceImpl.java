package project.euna.issue.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.euna.issue.dao.IssueDAOImpl;
import project.euna.issue.vo.AppendixVO;
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
	
	
	
	//글 등록
	@Override
	public void  issueInsert(IssueVO issueVO) {
		int result = issueDAO.issueInsert(issueVO);
		notifyDAO.notifyInsert(issueVO);
		
		if (result == 0) {
			System.out.println("Join Fail!!");
		} else {
			System.out.println("Join Success!!");
		}
	}
	
	
	
	//목록 조회 페이징
	@Override
	public List<Map> searchList(Criteria cri) throws Exception{
		List<Map> list = issueDAO.searchList(cri);
		return list;
	}
	
	//게시물 총 갯수
	@Override
	public int listCount() throws Exception{
		return issueDAO.listCount();
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
	
	//파일 목록 조회
	@Override
		public List<Map> fileList(String i_Num) throws Exception{
			List<Map> list = issueDAO.fileList(i_Num);
			System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!service i_Num : "+i_Num);

			return list;
		}
		

	
	//첨부파일 삭제
		@Override
		public void fileDelete(AppendixVO appendixVO) throws Exception {
			issueDAO.fileDelete(appendixVO);
		}

}
