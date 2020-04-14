package contribution.kms.controller;

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

import contribution.model.BookmarkDto;
import contribution.model.Page;
import contribution.model.ResponseList;
import contribution.modelcount.ResponseCount;
import contribution.modelone.ResponseOne;
import contribution.service.BookmarkService;

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
	
	@Autowired
	public void setDao(BookmarkService dao) {
		this.dao = dao;
	}

	@Autowired
	public void setResTemplate(RestTemplate resTemplate) {
		this.resTemplate = resTemplate;
	}

	@RequestMapping(value = "/response.do")
	public String getResponse(Model model, @RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "") String search, HttpSession session, String organization_id) {
        
		int idx = (Integer)session.getAttribute("user_idx");
		
		List<BookmarkDto> bookmarkList = dao.selectBookmarkDto(idx); 
		
		
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
	
		
		
		model.addAttribute("bookmarkId", bookmarkList);

		model.addAttribute("search", search);

		model.addAttribute("Page", page);
		// int listCnt =list.getResponse().getBody().getTotalCount();

		return "organization/blog";
	}

	@RequestMapping("/board.do")
	public String getBoard(Model model, String nanmmbyId) {

		ResponseCount responsecount = resTemplate.getForObject(nanmmbyNmurl + serviceKey + progrmRegistNo + nanmmbyId,
				ResponseCount.class);

		int count = responsecount.getResponse().getBody().getTotalCount();
		int i;
		if (count == 1) {

			ResponseOne list = resTemplate.getForObject(nanmmbyNmurl + serviceKey + progrmRegistNo + nanmmbyId,
					ResponseOne.class);

			i = 1;

			model.addAttribute("rep_list", list);
			model.addAttribute("R", i);

		} else {
			i = 0;
			model.addAttribute("R", i);

		}
		return "about";

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
	
	

}
