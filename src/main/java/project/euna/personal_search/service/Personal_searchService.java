package project.euna.personal_search.service;


import java.util.List;
import java.util.Map;


import project.euna.personal_search.vo.Criteria;


public interface Personal_searchService {

	public List<Map> myBoardlist(Criteria cri) throws Exception;
	public int myBoardlistCount(String mem_Id) throws Exception;

}
