package project.euna.personal.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.euna.personal.dao.PersonalDAOImpl;
import project.euna.personal.vo.Criteria;
import project.euna.personal.vo.PersonalVO;
import project.euna.reply.vo.ReplyVO;
import project.notify.dao.NotifyDAOImpl;


@Service
public class PersonalServiceImpl implements PersonalService {
	
	@Autowired
	PersonalDAOImpl personalDAO;
	
	@Inject
	NotifyDAOImpl notifyDAO;
	
	//
	
	//글 등록
	@Override
	public void  personalInsert(Map map) {
		int result = personalDAO.personalInsert(map);
		//notifyDAO.notifyInsert(map);
		
	}
	
	
	
	//목록 조회 페이징
	@Override
	public List<Map> searchList(Criteria cri) throws Exception{
		List<Map> list = personalDAO.searchList(cri);
		return list;
	}
	
	//게시물 총 갯수
	@Override
	public int listCount(String c_Id) throws Exception{
		return personalDAO.listCount(c_Id);
	}
	
	//게시글 조회
	@Override
	public Map<String, Object> personalRead(String i_Num) {
		return personalDAO.personalRead(i_Num);
		
	}

	//글 삭제
	@Override
	public void personalDelete(String i_Num) throws Exception {
		personalDAO.personalDelete(i_Num);
	}

	//글 수정
	@Override
	public void personalUpdate(PersonalVO personalVO) throws Exception {
		personalDAO.personalUpdate(personalVO);
	}
	
	//이슈그룹 조회
	@Override
	public List<Map> igRead() {
		return personalDAO.igRead();
		
	}
	
	
	//협업공간 내 멤버 조회
	@Override
	public List<Map> comemRead(String c_id) {
		return personalDAO.comemRead(c_id);
		
	}
	
	//이슈 담당자 삽입
	@Override
	public void comemInsert(Map<String, Object> dataMap) throws Exception {
		// TODO Auto-generated method stub
		personalDAO.comemInsert(dataMap);
	}
	
	//협업공간 내 멤버 조회
	@Override
	public List<Map> chargerRead(String i_Num) {
		return personalDAO.chargerRead(i_Num);
		
	}
	
	//이슈 담당자 수정(삭제 후 다시 삽입)
	@Override
	public void chargerDelete(String i_Num) throws Exception {
		personalDAO.chargerDelete(i_Num);
	}
	
	
	//협업공간 조회
	//@Override
	public List<Map> coRead(String mem_id) {
		return personalDAO.coRead(mem_id);
		
	}
	
	//다른 협업공간으로 복사
	@Override
	public void  personalCopy(Map map) {
		int result = personalDAO.personalCopy(map);
		//notifyDAO.notifyInsert(map);
		
	}
	
	//글 목록 조회 시  이슈 담당자 화면에 뿌리기 용
	@Override
	public List<Map> chargerList(String c_Id) {
		return personalDAO.chargerList(c_Id);
	}
	

}
