package contribution.model;

import java.util.Date;
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
 public int insertGroupUser(GroupUserCommand guc) {
	 String user_id=guc.getUser_id();
	 String password=guc.getPassword();
	 String nickname=guc.getNickname();
	 Date register_date=guc.getRegister_date();
	 String organization_id=guc.getOrganization_id();
	 String nanmmByNm =guc.getNanmmByNm();
	 Map<String,Object> map =new HashMap<String, Object>();
	 
	 map.put("user_id", user_id);
	 map.put("password",password);
	 map.put("nickname", nickname);
	 map.put("register_date", register_date);
	 map.put("organization_id",organization_id);
	 map.put("name", nanmmByNm); 
	  return getSqlSession().insert("Kim.insert-group_user",map);
	 
 } 
 public int SelectOrganization_logoCount(String organization_id) {
	 
	return getSqlSession().selectOne("Kim.selectCount-organizationsLogo",organization_id);
		 
		 
		 
	 }
 
 public int InsertOrganization_logo(String organization_id,String original_file_name ,String stored_file_name,String url) {
	 
	 Map<String,Object> map = new HashMap<String,Object>();
	 map.put("original_file_name", original_file_name);
	 map.put("organization_id", organization_id);
	 map.put("stored_file_name", stored_file_name);
	 map.put("url", url);
	 return getSqlSession().insert("Kim.insert-organizationsLogo",map);
	 
 }
 
	 
 }
	

