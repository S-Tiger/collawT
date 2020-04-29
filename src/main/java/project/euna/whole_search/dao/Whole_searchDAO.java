package project.euna.whole_search.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.euna.whole_search.vo.Criteria;


public interface Whole_searchDAO {
//
	public List<Map> searchIssue(Criteria cri) throws DataAccessException;
	public int issueCount(Criteria cri) throws Exception;
	public List<Map> searchFile(Criteria cri) throws DataAccessException;
	public int fileCount(Criteria cri) throws Exception;
	public List<Map> searchVote(Criteria cri) throws DataAccessException;
	public int voteCount(Criteria cri) throws Exception;
	public List<Map> searchReply(Criteria cri) throws DataAccessException;
	public int replyCount(Criteria cri) throws Exception;
}
