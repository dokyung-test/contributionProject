package contribution.yjs.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import contribution.model.UserCommand;
import contribution.service.GibunigajoaService;

@Controller
public class GibunigajoaController {
	
	@Autowired
	GibunigajoaService gibunigajoaService;
	
	@RequestMapping("/main.do")
	public String mainForm(UserCommand command, HttpSession session) {
		
		//session.setAttribute("id", "abc");
		//session.invalidate();
		return "main";
	}
	
	@RequestMapping("/loginForm.do")
	public String loginForm() {
		return "loginForm";
	}
	
	@RequestMapping(value = "/loginCheck.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String loginCheck(String user_id, String password, HttpSession session) {
		Gson gson = new Gson();
		JsonObject json = new JsonObject();
		int num = 0;
		
		HashMap<String, String> m = new HashMap<String, String>();
		m.put("user_id", user_id);
		m.put("password", password);
		try {
			UserCommand command = gibunigajoaService.loginCheck(m);
			
			session.setAttribute("user_idx", command.getUser_idx());	
			session.setAttribute("user_id", command.getUser_id());	
			session.setAttribute("nickname", command.getNickname());	
			session.setAttribute("grade", command.getGrade());	
			session.setAttribute("user_type_id", command.getUser_type_id());	
			session.setAttribute("organization_id", command.getOrganization_id());
			
			num = 1;
			json.addProperty("num", num);
			
		}catch (NullPointerException e) {
			num=0;
			json.addProperty("num", num);
		}finally {
			return gson.toJson(json);
		}
		
	}
	
	
	@RequestMapping("/logout.do")
	public String logoutForm(HttpSession session) {
		session.invalidate();
		return "main";
	}
	
	//회원가입 개인, 단체 type에 따라 관련 회원가입 폼으로 보낸다.  
	@RequestMapping(value="/signupCheck.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String signUpForm(int num) {
		String signUpForm="";
		
		if(num == 1) { //개인
			signUpForm = "signUpIndividual";
			
		}else if(num == 2){ //단체
			signUpForm="signUpGroup";
		}
		
		return signUpForm;
	}
	
	//회원가입 ID 중복체크
	@RequestMapping(value="/signupIdCheck.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String signupIdCheck(String user_id) {
		JsonObject json = new JsonObject();
		Gson gson = new Gson();
		
		try {
			int num = 0;
			num = gibunigajoaService.signupIdCheck(user_id);
			json.addProperty("num", num);
		
		}catch (Exception e) {}
		
		return gson.toJson(json);
	}
	
	//개인 회원가입 Insert service로 가는 다리 
	@RequestMapping("/signUp.do")
	public String singnUpSuccess(UserCommand command) {
		command.setGrade(0);
		command.setRegister_date(new Date(System.currentTimeMillis()));
		command.setOrganization_id("");
		int result= gibunigajoaService.memberInsert(command);	
		String singnUpSuccess="";
		if(result > 0) {
			singnUpSuccess = "redirect:/loginForm.do";
		}
		
		return singnUpSuccess;
	}
	
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		//자동으로 원하는 형식으로 포멧해줌 
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
		//true null값 허용, false null값 불허

	}

	public void setGibunigajoaService(GibunigajoaService gibunigajoaService) {
		this.gibunigajoaService = gibunigajoaService;
	}
	
	

}
