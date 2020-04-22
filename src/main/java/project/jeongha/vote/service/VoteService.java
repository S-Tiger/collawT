package project.jeongha.vote.service;

import java.util.List;
import java.util.Map;

import project.jeongha.vote.vo.VoteVO;

public interface VoteService {

	public void voteInsert(Map<String, Object> v_Info);
	public void votedInsert(Map<String, Object> vd_Info);
	public List<VoteVO> voteList() throws Exception;
}
