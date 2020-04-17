package project.euna.appendix.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.euna.appendix.vo.AppendixVO;
import project.euna.issue.vo.IssueVO;


public interface AppendixService {

	
	public List<Map> fileList(String i_Num) throws Exception;
	public void updateFile(AppendixVO appendixVO) throws Exception;
}
