package project.jeongha.vote.dao;

import java.util.List;
import java.util.Map;

import project.jeongha.vote.vo.VoteVO;

public interface VoteDao {
	public int voteInsert(Map<String,Object> v_Info);
	public int votedInsert(Map<String,Object> vd_Info);
	public List<Map> voteList() throws Exception ;
	public List<Map> votedList() throws Exception ;
}
