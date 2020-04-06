package project.euna.reply.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.euna.reply.dao.ReplyDAOImpl;
import project.euna.reply.vo.ReplyVO;


@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	ReplyDAOImpl replyDAO;
	
	//목록 조회
		@Override
		public List<Map> searchList(String i_Num) throws Exception{
			List<Map> list = replyDAO.searchList(i_Num);
			System.out.println("service:"+list);
			return list;
		}
		
		
		
	//댓글 등록
	@Override
	public void  replyInsert(ReplyVO replyVO) {
		int result = replyDAO.replyInsert(replyVO);
		
		if (result == 0) {
			System.out.println("Join Fail!!");
		} else {
			System.out.println("Join Success!!");
		}
	}
//	
//	
//	
//	//게시글 조회
//	@Override
//	public Map<String, Object> issueRead(String i_Num) {
//		return issueDAO.issueRead(i_Num);
//		
//	}
//
//	//글 삭제
//	@Override
//	public void issueDelete(String i_Num) throws Exception {
//		issueDAO.issueDelete(i_Num);
//	}
//
//	//글 수정
//	@Override
//	public void issueUpdate(IssueVO issueVO) throws Exception {
//		issueDAO.issueUpdate(issueVO);
//	}

	
	

}
