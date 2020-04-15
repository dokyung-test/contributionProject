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
	
	
}
