package project.notify.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.euna.issue.vo.IssueVO;
import project.notify.vo.NotifyVO;

@Repository
public class NotifyDAOImpl implements NotifyDAO {
	IssueVO issueVO;

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int notifyInsert(IssueVO issueVO) {
		int result;
		result = sqlSession.update("notify.notifyInsert", issueVO);
		return result;
	}

	@Override
	public List<Map> searchNotify(Map<String, Object> searchMap) {
		// TODO Auto-generated method stub
		System.out.println("searchNotify에 들어가는데 i_Num 있는지 없는지 확인==:"+searchMap.toString());
		List<Map> list = sqlSession.selectList("notify.searchNotify", searchMap);
		System.out.println("서치타고 나와서 i_Content 어떻게 돼있는지=="+list.toString());
		return list;
	}

	@Override
	public void notifyUpdate(Map<String,Object>searchMap) {
		 sqlSession.update("notify.notifyUpdate",searchMap);
	}

	@Override
	public List<Map> viewNotify(Map<String, Object> searchMap) throws DataAccessException {
		List<Map> list = sqlSession.selectList("notify.viewNotify",searchMap);
		return list;
	}

	


}
