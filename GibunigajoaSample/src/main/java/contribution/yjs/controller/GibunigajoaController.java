package contribution.yjs.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import contribution.model.UserCommand;
import contribution.service.GibunigajoaService;

@Controller
public class GibunigajoaController {
	
	@Autowired
	GibunigajoaService gibunigajoaService;
	/* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
	@RequestMapping("/main.do")
	public String mainForm(UserCommand command, HttpSession session) {
		
		//session.setAttribute("id", "abc");
		//session.invalidate();
		return "main";
	}
	
	@RequestMapping("/loginForm.do")
	public String loginForm(Model model, HttpSession session) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        System.out.println("naverAuthUrl"+naverAuthUrl);
        //네이버 로그인 URL 연결 
        model.addAttribute("url", naverAuthUrl);
		return "loginForm";
	}
	
	//naver 로그인 유전정보 존재시 로그인, 비존재시 회원정보 INSERT
	 @RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
	            throws IOException, ParseException {
	        System.out.println("여기는 callback");
	       
	        OAuth2AccessToken oauthToken;
	        oauthToken = naverLoginBO.getAccessToken(session, code, state);
	        //1. 로그인 사용자 정보를 읽어온다.
	        apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
	        /** apiResult json 구조
	        {"resultcode":"00",
	        "message":"success",
	        "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
	        **/
	        //2. String형식인 apiResult를 json형태로 바꿈
	        JSONParser parser = new JSONParser();
	        Object obj = parser.parse(apiResult);
	        JSONObject jsonObj = (JSONObject) obj;
	        
	        //3. 데이터 파싱
	        //Top레벨 단계 _response 파싱
	        JSONObject response_obj = (JSONObject)jsonObj.get("response");
	        //response의 nickname값 파싱
	        String user_id = (String)response_obj.get("id");
	        String email = (String)response_obj.get("email");//naver email을 기부니가조아 페이지에선 ID로 사용
	        String name = (String)response_obj.get("name");
	        String nickname = (String)response_obj.get("nickname");
	        String birthday = (String)response_obj.get("birthday");
	        System.out.println("id: "+user_id+" email:"+email+" name: "+name+" nickname: "+nickname+ "birthday: "+birthday);
	        
	        //존재하는 유저인지 확인 
	        int num = gibunigajoaService.signupIdCheck(user_id);
	        
	        if(num == 0) { //존재하지 않을 경우 값을 저장
	        	UserCommand command = new UserCommand();
	        	
	        	command.setUser_id(email);
	        	command.setName(name);
	        	command.setNickname(nickname);
	        	command.setUser_type_id(1);
	        	command.setGrade(0);
	    		command.setRegister_date(new Date(System.currentTimeMillis()));
	    		command.setOrganization_id("");
	    			    		
	    		int	result= gibunigajoaService.kakaoNaverInsert(command);
	        }
	        
	        	UserCommand command2 = gibunigajoaService.kakaoNaverloginCheck(email);
	        
	        	session.setAttribute("user_idx", command2.getUser_idx());	
	        	session.setAttribute("user_id", command2.getUser_id());	
	        	session.setAttribute("nickname", command2.getNickname());	
	        	session.setAttribute("grade", command2.getGrade());	
	        	session.setAttribute("user_type_id", command2.getUser_type_id());
	        	session.setAttribute("organization_id", command2.getOrganization_id());

		    //4.파싱 닉네임 세션으로 저장
	        //session.setAttribute("sessionId",nickname); //세션 생성
	        //model.addAttribute("result", apiResult);
	        return "main";
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
	
	
	 @RequestMapping(value = "/oauth", produces = "application/json", method = { RequestMethod.GET, RequestMethod.POST })
	 public String kakaoLogin(@RequestParam("code") String code) {
		 //System.out.println(access_token);
	     return "home";
	 }
	 
	 @RequestMapping(value="/kakaologin.do")
	 public String kakaoLoginCheck() {
		 return "main";
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
	 @Autowired
	    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
	        this.naverLoginBO = naverLoginBO;
	    }
	

}
