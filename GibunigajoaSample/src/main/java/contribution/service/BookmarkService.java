package contribution.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import contribution.model.BookmarkDao;
import contribution.model.BookmarkDto;;

@Service 
public class BookmarkService {

	BookmarkDao dao;
    
	@Autowired
	public void setDao(BookmarkDao dao) {
		this.dao = dao;
	}
	
	
	public int insertOrDelete(int user_idx,String organization_id) {
		int i;
		if(dao.selectBookmark(user_idx, organization_id)==0) {
			dao.insertBookmark(user_idx, organization_id);
			i =1; 
		     return i;
		}else {
			dao.deleteBookmark(user_idx, organization_id);
			i=0;
			return i;
		}
		
	}
		
	public int selectBookmark(int user_idx,String organization_id) {
		
		
		return dao.selectBookmark(user_idx, organization_id);
	
		 
		
		
	}public List<BookmarkDto> selectBookmarkDto(int user_idx){
		
		
		return dao.selectBookmarkDto(user_idx);
		
	}
	
	
	
	
	
}
