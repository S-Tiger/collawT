package project.jeongha.vote.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.jeongha.vote.dao.VoteDaoImpl;

@Service
public class VoteServiceImpl implements VoteService{

	@Autowired
	VoteDaoImpl voteDao;
	
	@Override
	public void voteInsert(Map<String, Object> v_Info) {
		voteDao.voteInsert(v_Info);
		
	}

	
	
}
