package project.notify.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import project.euna.issue.vo.IssueVO;
import project.notify.dao.NotifyDAOImpl;
import project.notify.vo.NotifyVO;

@Service
public class NotifyServiceImpl implements NotifyService{
	
	@Autowired
	NotifyDAOImpl notifyDAO;

	@Override
	public void notifyInsert(IssueVO issueVO) {
		int result = notifyDAO.notifyInsert(issueVO);
		
		if(result == 0) {
			System.out.println(" noti insert fail");
		}else {
			System.out.println(" noti insert success");
		}
		
		
	}

	@Override
	public List<Map> searchNotify(Map<String, Object> searchMap) {
		// TODO Auto-generated method stub
		List<Map> list = notifyDAO.searchNotify(searchMap);
		return list;
	}

	public void notifyUpdate(Map<String,Object> searchMap) {
		// TODO Auto-generated method stub
		 notifyDAO.notifyUpdate(searchMap);
		
		
	}

	@Override
	public List<Map> viewNotify(Map<String, Object> searchMap) throws DataAccessException {
		List<Map> list = notifyDAO.viewNotify(searchMap);
		return list;
	}

	

	
	
}
