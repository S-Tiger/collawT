package project.notify.dao;

import java.util.List;
import java.util.Map;

import project.euna.issue.vo.IssueVO;
import project.notify.vo.NotifyVO;

public interface NotifyDAO {
	public int notifyInsert(IssueVO issueVO);
	public List<NotifyVO> searchNotify (Map<String, Object> searchMap);
	public int notifyUpdate(NotifyVO notifyVO);
	public int viewNotify(int str);

}
