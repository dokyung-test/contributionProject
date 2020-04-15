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
	
	public UserCommand kakaoNaverloginCheck(String user_id) {
		UserCommand command = getSqlSession().selectOne("gibunigajoa.kakaoNaverloginCheck", user_id);
		return command;
	}
	//카카오톡 네이버 회원정보 저장
	public int kakaoNaverInsert(UserCommand command) {
		return getSqlSession().insert("gibunigajoa.kakaoNaverInsert", command);
	}
	
	//기부내역 가입자 금액 sum 등급 
	public int contributionSum(int user_idx) {
		return getSqlSession().selectOne("gibunigajoa.contributionSum", user_idx);
	}
	
}
