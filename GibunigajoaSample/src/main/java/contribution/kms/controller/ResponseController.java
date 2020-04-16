package contribution.kms.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.annotations.JsonAdapter;

import contribution.model.BookmarkDto;
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
		
		ResponseCount responsecount = resTemplate.getForObject(url + serviceKey + keyword + search,
				ResponseCount.class);

		int count = responsecount.getResponse().getBody().getTotalCount();
		Page page = new Page(count, curPage);
		int i;
		if (count == 1) {
			ResponseOne list1 = resTemplate.getForObject(url + serviceKey +numOfRows+pageNo + curPage + keyword + search,
					ResponseOne.class);
			i = 1;
			model.addAttribute("rep", list1);
			model.addAttribute("R", i);
		} else if (count > 1) {
			ResponseList list1 = resTemplate.getForObject(url + serviceKey +numOfRows +pageNo + curPage + keyword + search,
					ResponseList.class);
			i = 0;
			model.addAttribute("rep_List", list1);
			model.addAttribute("R", i);
		} else { 
			i = 2;

			model.addAttribute("R", i);
		}
	
		
		
	

		model.addAttribute("search", search);

		model.addAttribute("Page", page);
		// int listCnt =list.getResponse().getBody().getTotalCount();

		return "blog";
	}

	@RequestMapping("/board.do")
	public String getBoard(Model model, String nanmmbyId,HttpSession session) {

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
		if (count == 1) {
         
			ResponseOne list = resTemplate.getForObject(nanmmbyNmurl + serviceKey + progrmRegistNo + nanmmbyId,
					ResponseOne.class);

			i = 1;

			model.addAttribute("rep_list", list);
			model.addAttribute("R", i);

		} else {
			//검색결과가 없는 애들은  DB에저장한 기부단체를 뿌려줌
	    GroupUserCommand list =dosdao.Detail(nanmmbyId);
		
			i = 0;
			model.addAttribute("R", i);
            model.addAttribute("rep_list", list);
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
	
		
		model.addAttribute("nanmmByNm", nanmmByNm);

		model.addAttribute("Page", page);
		
		
		
	return "organization/response";
	}
	
	
	@RequestMapping(value = "/bookmark.do",method = RequestMethod.POST)
	@ResponseBody
	public String getBoomark(Model model,HttpSession session,
			String organization_id)throws Exception {
		System.out.println("organization_id:::"+organization_id);
		//session.setAttribute("id", 1);
		int idx = (Integer)session.getAttribute("user_idx"); 
		String i =dao.insertOrDelete(idx, organization_id)+"";
	
		return i;
		
	}
	@RequestMapping(value = "GroupUserSignup.do",method=RequestMethod.POST)
	public String GroupUser(Model model,GroupUserCommand guc) {
		guc.setRegister_date(new Date(System.currentTimeMillis()));
		int i;
		  i = gusdao.insertOrganizations(guc);
		model.addAttribute("R",i);
		 
		 return "groupPro";
		 
	}
	
	

}
