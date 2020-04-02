package project.notify.service;

import org.springframework.beans.factory.annotation.Autowired;

import project.notify.dao.NotifyDAOImpl;
import project.notify.vo.NotifyVO;

public class NotifyServiceImpl implements NotifyService{
	
	@Autowired
	NotifyDAOImpl notifyDAO;

	@Override
	public void notifyInsert(NotifyVO notifyVO) {
		int result = notifyDAO.notifyInsert(notifyVO);
		
		if(result == 0) {
			System.out.println(" noti insert fail");
		}else {
			System.out.println(" noti insert success");
		}
		
		
	}

}
