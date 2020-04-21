package contribution.service;

import java.util.List;

import javax.xml.ws.Action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import contribution.model.GroupUserCommand;
import contribution.model.GroupUserDao;
import contribution.model.OrganizationLogosDto;

@Service
public class GroupUserService {

	GroupUserDao dao;
	
	@Autowired
	public void setDao(GroupUserDao dao) {
		this.dao = dao;
		
	}
	
	public int insertOrganizations(GroupUserCommand guc) {
		int i;
		
		String organization_id=guc.getOrganization_id();
		if(dao.selectGroupUserCount(organization_id)==0) {
			dao.insertOrganizations(guc);
			dao.insertGroupUser(guc);
		return	i=1;
			
		}else {
		return	i=0;
		
		} 

	}
	
	public  GroupUserCommand selectUserAll(int user_idx) {
		
		return dao.selectUserAll(user_idx);
	} 
	
	
public int deleteOrganization(String organization_id)	{
	
	return dao.deleteOrganization(organization_id);
}
	
	
	
public int deleteLogo(String organization_id) {
	
	return dao.DeleteLogo(organization_id);
	
}	
	
	
public int InsertorDelete(String organization_id,String original_file_name ,String stored_file_name,String url) {
		
		int i ;
		if(dao.SelectOrganization_logoCount(organization_id)<1) {
			dao.InsertOrganization_logo(organization_id, original_file_name, stored_file_name, url);
			return i=1;
			
			
		}else {
			dao.DeleteLogo(organization_id);
			
			dao.InsertOrganization_logo(organization_id, original_file_name, stored_file_name, url);
			
			return i=1;}
		
		
	}
	
	
	
	
	
	
	
	public int InsertOrganization_logo(String organization_id,String original_file_name ,String stored_file_name,String url) {
		
		int i ;
		if(dao.SelectOrganization_logoCount(organization_id)<1) {
			dao.InsertOrganization_logo(organization_id, original_file_name, stored_file_name, url);
			return i=1;
			
			
		}else {
			
			
			
			
			
			return i=0;}
		
		
	}
	public String selectStored_file_name(String organization_id) {
		
		return dao.selectStored_file_name(organization_id);
	}
   
	public String selectStored_file_nameList(String organization_id) {
		
		
		return dao.selectStored_file_nameList(organization_id);
		
	}
	
	public int updatelogo(int user_idx,String password,String nickname,String user_id) {
		
		return dao.updatelogo(user_idx, password, nickname, user_id);
		
		
	}
	
	public OrganizationLogosDto selectLogo(String organization_id) {
		
		return dao.selectLogo(organization_id);
	}
	

	
}
