package project.notify.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.euna.issue.vo.IssueVO;
import project.notify.vo.NotifyVO;

public interface NotifyDAO {
	public int notifyInsert(IssueVO issueVO);
	public List<Map> searchNotify (Map<String, Object> searchMap);
	public void notifyUpdate(Map<String,Object> searchMap);
	public List<Map> viewNotify(Map<String,Object> searchMap) throws DataAccessException;

}
