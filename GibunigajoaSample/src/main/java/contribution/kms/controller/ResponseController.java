package contribution.kms.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.executor.ReuseExecutor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.annotations.JsonAdapter;

import contribution.model.BookmarkDto;
import contribution.model.FileUploadOrganization;

import contribution.model.GroupUserCommand;
import contribution.model.Page;
import contribution.model.Program;
import contribution.model.ResponseList;
import contribution.modelcount.ResponseCount;
import contribution.modelone.ResponseOne;
import contribution.service.BookmarkService;
import contribution.service.DetailOrganizationService;
import contribution.service.GroupUserService;

@Controller
public class ResponseController {

	String url = "http://openapi.1365.go.kr/openapi/service/rest/ContributionGroupService/getCntrSearchWordGrpList";
	String serviceKey = "?ServiceKey=OoQE1Tuy5qcIaGlrTrOm1540TFfC5bkZCTya7G3YDd13DNpFxMB7y1LYcYr4xCThRKiqvp81fEGfk4N8JYkkrA%3D%3D";
	String alldata = "&numOfRows=3127";
	String pageNo = "&pageNo=";
	String keyword = "&keyword=";
	String numOfRows="&numOfRows=6";
	String progrmRegistNo = "&progrmRegistNo=";

	String nanmmbyNmurl = "http://openapi.1365.go.kr/openapi/service/rest/ContributionGroupService/getCntrGrpInfo";
	RestTemplate resTemplate;

	BookmarkService dao;
	GroupUserService gusdao;
	DetailOrganizationService dosdao;
	FileUploadOrganization file;
	
	@Autowired //검새결과 없어서 400오류뜨는 상세화면 기부단체 Dao주입
	public void setDosdao(DetailOrganizationService dosdao) {
		this.dosdao=dosdao;
	}
	
	
    @Autowired  //단체회원가입 Dao 주입
	public void setGusdao(GroupUserService gusdao) {
		this.gusdao = gusdao;
	}

	
	@Autowired //즐겨찾기 Dao 주입
	public void setDao(BookmarkService dao) {
		this.dao = dao;
	}

	@Autowired 
	public void setResTemplate(RestTemplate resTemplate) {
		this.resTemplate = resTemplate;
	}
   
	//전체리스트 뿌려주기위한 컨트롤러
	@RequestMapping(value = "/response.do")
	public String getResponse(Model model, @RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "") String search, HttpSession session, String organization_id) {
        
		
		//로그인을 한다면 즐겨찾기 보여주고 안하면 보여주지 않음
		if(session.getAttribute("user_idx") != null) {
		
		int	x = 1;
		int idx = (Integer)session.getAttribute("user_idx");
		
		List<BookmarkDto> bookmarkList = dao.selectBookmarkDto(idx); 
		
		model.addAttribute("bookmarkId", bookmarkList);
		
		model.addAttribute("R2",x);
		}
		//키워드에따른 검색결과수 확인하기
		ResponseCount responsecount = resTemplate.getForObject(url + serviceKey + keyword + search,
				ResponseCount.class);
          //검색결과수 변수에저장 
		int count = responsecount.getResponse().getBody().getTotalCount();
		//페이징처리
		Page page = new Page(count, curPage);
		int i;
		//검색결과수가 1과 같으면 list에 안들어가기때문에 ResponseOne Dto사용
		if (count == 1) {
			ResponseOne list1 = resTemplate.getForObject(url + serviceKey +numOfRows+pageNo + curPage + keyword + search,
					ResponseOne.class);
			i = 1;
			model.addAttribute("rep", list1);
			model.addAttribute("R", i);
	    //검색 결과수가 1보다 많으면 여러개받아 list에 넣어줘야하기때문에 ResponseList Dto사용
		} else if (count > 1) {
			ResponseList list1 = resTemplate.getForObject(url + serviceKey +numOfRows +pageNo + curPage + keyword + search,
					ResponseList.class);
			i = 0;
			model.addAttribute("rep_List", list1);
			model.addAttribute("R", i);
			//검색 결과수가 아예없으면  i변수에 2 리턴해서 jsp에 검색결과없음 띄어주기
		} else { 
			i = 2;

			model.addAttribute("R", i);
		}
	
		
		
	
        //검색했을때 선택한 페이지 그대로 유지해야하기때문에  검색한 키워드 다시들고감
		model.addAttribute("search", search);
        //페이지 계산해서 jsp로 들고감
		model.addAttribute("Page", page);
		

		return "blog";
	}
//기부단체 상세화면
	@RequestMapping("/board.do")
	public String getBoard(Model model, String nanmmbyId,HttpSession session) {

      //로그인하지않으면 즐겨찾기 숨기고 로그인을했으면 즐겨찾기 보여주기
		if(session.getAttribute("user_idx") != null) {
			
			int	x = 1;
			int idx = (Integer)session.getAttribute("user_idx");
			
			int chk = dao.DetailBookmarkChk(idx, nanmmbyId);
			
			model.addAttribute("chk", chk);
			
			model.addAttribute("R2",x);
			}
		
		
		ResponseCount responsecount = resTemplate.getForObject(nanmmbyNmurl + serviceKey + progrmRegistNo + nanmmbyId,
				ResponseCount.class);

		int count = responsecount.getResponse().getBody().getTotalCount();
		int i;
		//검색결과가 없으면 400이 뜨는오류때문에 1개의 검색결과와 0개의 검색결과를 나눔(검새결과가 무조건 1개 아니면 0개이다.)
		//검색결과가 1인경우 공공데이터에서 받아온 값 jsp로 넘겨주기
		if (count == 1) {
         
			ResponseOne list = resTemplate.getForObject(nanmmbyNmurl + serviceKey + progrmRegistNo + nanmmbyId,
					ResponseOne.class);

			i = 1;

			model.addAttribute("rep_list", list);
			model.addAttribute("R", i);
			
			//공공데이터받아온 String타입의 설립일을 중간중간에 년월일 추가시키기 
			if(!list.getResponse().getBody().getItems().getItem().getFondDe().isEmpty()) {
	  		      String str = list.getResponse().getBody().getItems().getItem().getFondDe();
	  		      StringBuffer sb=new StringBuffer(str);
	  		      sb.insert(4, "년 ");
	  		      sb.insert(8, "월 ");
	  		      sb.insert(12,"일");
	  		      model.addAttribute("date",sb);
			}
			 

		} else {
			//검색결과가 없는 애들은  DB에저장한 기부단체상세값  jsp로 넘겨주기
	   
			GroupUserCommand list =dosdao.Detail(nanmmbyId);
          System.out.println(list.getOrganization_id());
			if(list.getOrganization_id()!=null) {
			  i = 0;
				model.addAttribute("R", i);
	            model.addAttribute("rep_list", list);

		  }else {
			  i=2;
			  model.addAttribute("R", i);
		  }
			
			
			
        
            //공공데이터받아온 String타입의 설립일을 중간중간에 년월일 추가시키기 
        	if(list.getFondDe() != null) {
    		      String str = list.getFondDe();
    		      StringBuffer sb=new StringBuffer(str);
    		      sb.insert(4, "년 ");
    		      sb.insert(8, "월 ");
    		      sb.insert(12,"일");
    		      model.addAttribute("date",sb);
        	}
            
            
		}
		//해당 list가 있으면 해당단체에 모집프로그램이있다는뜻이고 list가 비어있다면 해당단체에 모집프로그램이없다는뜻
		List<Program> list = dosdao.DetailProgram(nanmmbyId);
		if(list.size()!=0) {
			i=1;
			model.addAttribute("program", list);
			model.addAttribute("R1", i);
		}else {
			i=0;
			model.addAttribute("R1", i);
		}
		
		return "about";

	}
	//기부단체 회원가입시 검색결과에 리스트뿌려주기
	@RequestMapping(value = "/searchOrganiztion.do",method = RequestMethod.GET)
	
	public String searchOrganization(Model model,String nanmmByNm,@RequestParam(defaultValue = "1") int curPage) {
		
	
		
		ResponseCount responsecount = resTemplate.getForObject(url + serviceKey + keyword + nanmmByNm,
				ResponseCount.class);

		
		
		int count = responsecount.getResponse().getBody().getTotalCount();
		Page page = new Page(count, curPage);
		int i;
		if (count == 1) {
			ResponseOne list1 = resTemplate.getForObject(url + serviceKey +numOfRows+pageNo + curPage + keyword + nanmmByNm,
					ResponseOne.class);
			i = 1;
			model.addAttribute("rep", list1);
			model.addAttribute("R", i);
			//String타입으로들어
		
			
		} else if (count > 1) {
			ResponseList list1 = resTemplate.getForObject(url + serviceKey +numOfRows +pageNo + curPage + keyword + nanmmByNm,
					ResponseList.class);
			i = 0;
			model.addAttribute("rep_List", list1);
			model.addAttribute("R", i);
		} else { 
			i = 2;

			model.addAttribute("R", i);
		}
	
		//페이징 처리하기위해 검색한 키워드 들고감
		model.addAttribute("nanmmByNm", nanmmByNm);

		model.addAttribute("Page", page);
		
		
		//타일즈 헤더 풋터 필요없기때문에 앞에 경로 붙여줌
	return "organization/response";
	}
	
	//즐겨찾기 컨트롤러
	@RequestMapping(value = "/bookmark.do",method = RequestMethod.POST)
	@ResponseBody
	//로그인한 세션값 idx와 등록번호 받아오기
	public String getBoomark(Model model,HttpSession session,
			String organization_id)throws Exception {
		
	//세션에 idx만 캐스팅후 변수에저장
		int idx = (Integer)session.getAttribute("user_idx"); 
		//dao에서 인서트인지 딜리트인지 검사한후 인서트 아니면 딜리트 시켜줌 인서트면 1 딜리트면 0 리턴받아옴
		String i =dao.insertOrDelete(idx, organization_id)+"";
	
		return i;
		
	}
	//단체회원가입 컨트롤러
	@RequestMapping(value = "GroupUserSignup.do",method=RequestMethod.POST)
	public String GroupUser(Model model,GroupUserCommand guc,@RequestParam("banner") MultipartFile banner,HttpServletRequest request) {
		//파일업로드
		String root = request.getServletContext().getRealPath("resources/images/");
		System.out.println(root);
		String stored_file_name ="";
		String original_file_name="";
		String organization_id= guc.getOrganization_id();
		System.out.println("이거맞냐?"+organization_id+"banner"+banner+"root"+root);
		Map<String,String> fileInfo =file.bannerImageUpload(banner, organization_id, root);
		stored_file_name = fileInfo.get("stored_file_name");
		original_file_name = fileInfo.get("original_name");
         int i1;
         i1 = gusdao.InsertOrganization_logo(organization_id, original_file_name, stored_file_name, root);
		
		
		//현재시간 저장
		guc.setRegister_date(new Date(System.currentTimeMillis()));
		int i;
		//인서트
		  i = gusdao.insertOrganizations(guc);
		model.addAttribute("R",i);
		 
		 return "groupPro";
		 
	}
	
	

}
