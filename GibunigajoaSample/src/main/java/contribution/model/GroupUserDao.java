package contribution.model;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class GroupUserDao extends SqlSessionDaoSupport {

	 
	
	
 public int selectGroupUserCount(String organization_id) {
	 
	 
	 return getSqlSession().selectOne("Kim.select-organizations_count",organization_id);
 }	
 
 public int insertOrganizations(GroupUserCommand guc) {
	 
	 return getSqlSession().insert("Kim.insert-organizations",guc); 
 }
 public int insertGroupUser(String user_id,String password) {
	 
	 Map<String,Object> map =new HashMap<String, Object>();
	 
	 map.put("user_id", user_id);
	 map.put("password",password);
	  return getSqlSession().insert("Kim.insert-group_user",map);
	 
 } 
 
	
}
