package project.sungho.apply.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import project.sungho.apply.dao.ApplyDAO;
import project.sungho.apply.vo.ApplyVO;



@Service
public class ApplyServiceImpl implements ApplyService{
	
	@Autowired
	ApplyDAO applyDAO;

	@Override
	public List<ApplyVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateApply(Map<String, Object> dataMap) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertApply(Map<String, Object> dataMap) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteApply(Map<String, Object> dataMap) throws Exception {
		// TODO Auto-generated method stub
		
	}

	
	@Override
	public int memberCheck(String mem_Id) throws Exception {
		// TODO Auto-generated method stub
		return applyDAO.memberCheck(mem_Id);
		 
	}

}
