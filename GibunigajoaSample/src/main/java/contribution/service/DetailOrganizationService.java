package contribution.service;



import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import contribution.model.DetailOrganizationDao;
import contribution.model.GroupUserCommand;
import contribution.model.Program;

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
	//해당 단체에 프로그램이있을경우 리턴해주고 없다면 빈 리스트 리턴
	public List<Program> DetailProgram(String organization_id){
		
		if(dao.DetailPrgramCount(organization_id)>=1) {
			return dao.DetailProgram(organization_id);
			
		}else {return Collections.EMPTY_LIST;}
		
		
	}
	
	
	
}
