package project.euna.appendix.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.euna.appendix.dao.AppendixDAO;
import project.euna.appendix.vo.AppendixVO;
import project.euna.issue.vo.IssueVO;


@Service
public class AppendixServiceImpl implements AppendixService {
	
	@Autowired
	AppendixDAO appendixDAO;

	//파일 목록 조회
	@Override
		public List<Map> fileList(String i_Num) throws Exception{
			List<Map> list = appendixDAO.fileList(i_Num);

			return list;
		}
		

	
	//첨부파일 수정
		@Override
		public void updateFile(AppendixVO appendixVO) throws Exception {
			appendixDAO.updateFile(appendixVO);
			
//			List<Map<String, Object>> list = appendixVO.parseUpdateFileInfo(issueVO, files, fileNames, mpRequest);
//			Map<String, Object> tempMap = null;
//			int size = list.size();
//			for(int i = 0; i<size; i++) {
//				tempMap = list.get(i);
//				if(tempMap.get("IS_NEW").equals("Y")) {
//					appendixDAO.uploadFile(tempMap);
//				}else {
//					appendixDAO.uploadFile(tempMap);
//				}
//			}
		}

}

