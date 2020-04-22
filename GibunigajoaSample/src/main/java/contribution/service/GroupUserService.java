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
	//해당단체가 가지고있는 유저데이터뿌려주기
	public  GroupUserCommand selectUserAll(int user_idx) {
		
		return dao.selectUserAll(user_idx);
	} 
	
	
public int deleteOrganization(String organization_id)	{
	
	return dao.deleteOrganization(organization_id);
}
	
	
	//이미지파일 딜리트
public int deleteLogo(String organization_id) {
	
	return dao.DeleteLogo(organization_id);
	
}	
	
//해당 단체유저가 이미지파일이 이미있는경우 딜리트후 인서트 이미지파일이없는경우는 인서트만 해줌
public int InsertorDelete(String organization_id,String original_file_name ,String stored_file_name,String url) {
		
		int i ;
		//로고테이블에  이미지레코드가없는경우 바로 인서트
		if(dao.SelectOrganization_logoCount(organization_id)<1) {
			dao.InsertOrganization_logo(organization_id, original_file_name, stored_file_name, url);
			return i=1;
			
			
		}else {
			//로고테이블에 이미 이미지레코드가 있는경우 딜리트후 인서트
			dao.DeleteLogo(organization_id);
			//인서트
			dao.InsertOrganization_logo(organization_id, original_file_name, stored_file_name, url);
			
			return i=1;}
		
		
	}
	
	
	
	
	
	
	//단체회원가입시 이미지테이블에 이미지 추가하기
	public int InsertOrganization_logo(String organization_id,String original_file_name ,String stored_file_name,String url) {
		
		int i ;
		//처음 회원가입시 해당 등록번호에 매칭되어있는 이미지테이블에 레코드가  없겠지만 혹시몰라서 카운트 로뽑아내서 0일경우에만 인서트 시키기
		if(dao.SelectOrganization_logoCount(organization_id)<1) {
			dao.InsertOrganization_logo(organization_id, original_file_name, stored_file_name, url);
			return i=1;
			
			
		}else {
			
			
			
			
			
			return i=0;}
		
		
	}//공공데이터에서받아온 등록번호와 우리db에 이미지테이블에 등록번호와 일치하는 이미지파일이름만 빼오기
	public String selectStored_file_name(String organization_id) {
		
		return dao.selectStored_file_name(organization_id);
	}
	//공공데이터에서받아온 등록번호와 우리db에 이미지테이블에 등록번호와 일치하는 이미지파일이름만 빼오기
	public String selectStored_file_nameList(String organization_id) {
		
		
		return dao.selectStored_file_nameList(organization_id);
		
	}
	//단체회원 유저테이블 수정하기
	public int updatelogo(int user_idx,String password,String nickname,String user_id) {
		
		return dao.updatelogo(user_idx, password, nickname, user_id);
		
		
	}
	//해당 단체유저가 가지고있는 이미지파일 불러오기
	public OrganizationLogosDto selectLogo(String organization_id) {
		
		return dao.selectLogo(organization_id);
	}
	

	
}
