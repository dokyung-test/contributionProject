package contribution.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class BookmarkDao extends SqlSessionDaoSupport {

	
	
	public int selectBookmark(int user_idx,String organization_id) {
		 
	  Map<String,Object> map = new HashMap<String, Object>();
	  
	  map.put("user_idx",user_idx);
	  map.put("organization_id",organization_id);
		
	    
	  return 	getSqlSession().selectOne("Kim.select-bookmark",map);
		
		
	}
	public int insertBookmark(int user_idx,String organization_id,String nanmmbyNm) {
	
		Map<String,Object> map = new HashMap<String, Object>();
		  System.out.println("모집단체명:::::"+nanmmbyNm);
		  map.put("user_idx",user_idx);
		  map.put("organization_id",organization_id);
		  map.put("nanmmbyNm",nanmmbyNm);
		
		
		return getSqlSession().insert("Kim.insert-bookmark",map);  
	}
	public int deleteBookmark(int user_idx,String organization_id) {

		Map<String,Object> map = new HashMap<String, Object>();
		  
		  map.put("user_idx",user_idx);
		  map.put("organization_id",organization_id);
		
		return getSqlSession().delete("Kim.delete-bookmark",map);
		
	}
	public List<BookmarkDto> selectBookmarkDto(int user_idx){
		
		return getSqlSession().selectList("Kim.select-organization_id",user_idx);
	}
	
	
	



	
	
	
	
	
	
	
}
