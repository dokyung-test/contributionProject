package contribution.model;

import java.util.HashMap;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class UserDao extends SqlSessionDaoSupport{

	public int memberInsert(UserCommand command) {
		return getSqlSession().insert("gibunigajoa.memberInsert", command);
	}
	
	public int signupIdCheck(String user_id) {
		int num = getSqlSession().selectOne("gibunigajoa.signupIdCheck", user_id);
		System.out.println("Snum: "+num);
		return num;
	}
	
	public UserCommand loginCheck(HashMap<String, String> m) {
		UserCommand command = getSqlSession().selectOne("gibunigajoa.loginCheck", m);
		return command;
	}
}
