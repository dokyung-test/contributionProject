package contribution.model;

 

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class DetailOrganizationDao extends SqlSessionDaoSupport {

   public GroupUserCommand Detail(String organization_id){
	   
	 
	 return getSqlSession().selectOne("Kim.select-organizationsAll",organization_id) ;
   }
	
	
}
