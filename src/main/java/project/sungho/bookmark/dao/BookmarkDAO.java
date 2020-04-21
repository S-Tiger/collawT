package project.sungho.bookmark.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.RequestParam;

import project.sungho.apply.vo.ApplyVO;


public interface BookmarkDAO {

	
	public List<Map> searchList(Map<String, Object> searchMap) throws DataAccessException; ;
	 
	 public void updateBookmark(Map<String, Object> dataMap) throws DataAccessException;
	 public int insertBookmark(Map<String, Object> dataMap) throws DataAccessException;
	 public int deleteBookmark(Map<String, Object> dataMap) throws DataAccessException;
	 
	 public int bookmarkCheck(Map<String, Object> dataMap) throws Exception;
	 
	 public int acceptBookmark(Map<String, Object> dataMap) throws Exception;
	 
	 public int rejectBookmark(Map<String, Object> dataMap) throws Exception;
}
