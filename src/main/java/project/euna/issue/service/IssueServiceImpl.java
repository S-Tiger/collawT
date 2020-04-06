package project.euna.issue.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.euna.issue.dao.IssueDAOImpl;
import project.euna.issue.vo.IssueVO;


@Service
public class IssueServiceImpl implements IssueService {
	
	@Autowired
	IssueDAOImpl issueDAO;
	
	
	//글 등록
	@Override
	public void  issueInsert(IssueVO issueVO) {
		int result = issueDAO.issueInsert(issueVO);
		
		if (result == 0) {
			System.out.println("Join Fail!!");
		} else {
			System.out.println("Join Success!!");
		}
	}
	
	//목록 조회
	@Override
	public List<Map> searchList() throws Exception{
		List<Map> list = issueDAO.searchList();
		return list;
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

	
	

}
