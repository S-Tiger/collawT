package project.notify.service;

import java.util.List;
import java.util.Map;

import project.euna.issue.vo.IssueVO;
import project.notify.vo.NotifyVO;

public interface NotifyService {
	
	public void notifyInsert(IssueVO issueVO);
	public List<NotifyVO> searchNotify (Map<String, Object> searchMap);
	
	public void notifyUpdate(NotifyVO notifyVO);
	public int viewNotify(int str);


}
