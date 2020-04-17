package contribution.service;

import javax.xml.ws.Action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import contribution.model.GroupUserCommand;
import contribution.model.GroupUserDao;

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
	public int InsertOrganization_logo(String organization_id,String original_file_name ,String stored_file_name,String url) {
		
		int i ;
		if(dao.SelectOrganization_logoCount(organization_id)>=1) {
			dao.InsertOrganization_logo(organization_id, original_file_name, stored_file_name, url);
			return i=1;
			
			
		}else {return i=0;}
		
		
	}

	
	
	
	
	
	
	
}
