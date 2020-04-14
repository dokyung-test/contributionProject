package contribution.service;


import java.util.HashMap;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import contribution.model.UserCommand;
import contribution.model.UserDao;


@Service
public class GibunigajoaService{
	@Autowired
	UserDao userDao;

	@Autowired
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	public int memberInsert(UserCommand command) {
		return userDao.memberInsert(command);
	}
	
	public int signupIdCheck(String user_id) {
		return userDao.signupIdCheck(user_id);
	}
	
	public UserCommand loginCheck(HashMap<String, String> m) {
		return userDao.loginCheck(m);
	}
	
	public UserCommand kakaoNaverloginCheck(String user_id) {
		return userDao.kakaoNaverloginCheck(user_id);
	}
	
	//카카오톡 네이버 회원정보 저장 
	public int kakaoNaverInsert(UserCommand command) {
		return userDao.kakaoNaverInsert(command);
	}
}
