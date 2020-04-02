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
	public List<IssueVO> searchList(Map<String, Object> searchMap) {
		List<IssueVO> list =  issueDAO.searchList(searchMap); 
		return list;
		// TODO Auto-generated method stub
	}
	
	//�Խñ� ��ȸ
	@Override
	public IssueVO issueRead(String i_Num) {
		return issueDAO.issueRead(i_Num);
		
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
