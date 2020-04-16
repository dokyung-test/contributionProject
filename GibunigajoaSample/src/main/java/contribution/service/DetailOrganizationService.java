package contribution.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import contribution.model.DetailOrganizationDao;
import contribution.model.GroupUserCommand;

@Service
public class DetailOrganizationService {

	
	DetailOrganizationDao dao;

	@Autowired
	public void setDao(DetailOrganizationDao dao) {
		this.dao = dao;
	}
	
	public GroupUserCommand Detail(String organization_id){
		
		
		return dao.Detail(organization_id);
		
	}
	
	
	
	
}
