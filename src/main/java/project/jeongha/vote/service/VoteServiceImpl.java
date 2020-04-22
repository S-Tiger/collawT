package project.jeongha.vote.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.jeongha.vote.dao.VoteDaoImpl;
import project.jeongha.vote.vo.VoteVO;

@Service
public class VoteServiceImpl implements VoteService{

	@Autowired
	VoteDaoImpl voteDao;
	
	//투표 제목, 
	@Override
	public void voteInsert(Map<String, Object> v_Info) {
		voteDao.voteInsert(v_Info);
		
	}
	//투표 보기 
	@Override
	public void votedInsert(Map<String, Object> vd_Info) {
		voteDao.votedInsert(vd_Info);
	}
	//투표목록
	@Override
	public List<VoteVO> voteList() throws Exception {
		List<VoteVO> result =voteDao.voteList(); 
		return result;
	}

	
	
}
