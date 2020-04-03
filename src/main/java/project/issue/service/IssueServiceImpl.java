package project.issue.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.issue.dao.IssueDAOImpl;
import project.issue.vo.IssueVO;


@Service
public class IssueServiceImpl implements IssueService {
	
	@Autowired
	IssueDAOImpl issueDAO;
	
	
	//�� �Է�
	@Override
	public void  issueInsert(IssueVO issueVO) {
		int result = issueDAO.issueInsert(issueVO);
		
		if (result == 0) {
			System.out.println("Join Fail!!");
		} else {
			System.out.println("Join Success!!");
		}
	}
	
	//�� ��� ��ȸ
	@Override
	public List<Map> searchList() throws Exception{
		List<Map> list = issueDAO.searchList();
		return list;
	}
	
	//�Խñ� ��ȸ
	@Override
	public List<Map> issueRead(String i_Num) {
		List<Map> list = null;
		list = issueDAO.issueRead(i_Num);
		return list;
		
	}

	//�� ����
	@Override
	public void issueDelete(String i_Num) throws Exception {
		issueDAO.issueDelete(i_Num);
	}

	//�� ����
	@Override
	public void issueUpdate(IssueVO issueVO) throws Exception {
		issueDAO.issueUpdate(issueVO);
	}

	
	

}
