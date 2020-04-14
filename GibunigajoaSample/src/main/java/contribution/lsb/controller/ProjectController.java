package contribution.lsb.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import contribution.model.ContributionDto;
import contribution.model.QandADto;
import contribution.model.UserCommand;
import contribution.service.MypageService;

@Controller
public class ProjectController {

	@Autowired
	MypageService service;

	public void setService(MypageService service) {
		this.service = service;
	}

	// 기부내역 입력
	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	public String insertdonation(ContributionDto dto) {
		service.insertContribution(dto);
		return "redirect:/mypage.do";
	}

	// Q&A 입력
	@RequestMapping(value = "/qANDaInsert.do", method = RequestMethod.POST)
	public String qAndAInsert(QandADto dto) {
		service.insertQandA(dto);
		return "redirect:/qANDa.do";
	}

	// 기부 내역 user_idx를 받아서 리스트 보기
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public ModelAndView ContributionList(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		int idx = (int) session.getAttribute("user_idx");
		List<ContributionDto> list = service.ContributionList(idx);

		mav.addObject("list", list);
		mav.setViewName("mypage");
		return mav;
	}

	// Q&A user_idx를 받아서 리스트 보기
	@RequestMapping(value = "/qANDa.do", method = RequestMethod.GET)
	public ModelAndView QandAList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int idx = (int) session.getAttribute("user_idx");
		List<QandADto> list = service.QandAList(idx);
		mav.addObject("list", list);
		mav.setViewName("qANDa");
		return mav;
	}

	// 기부 내역 상세 글 보기
	@RequestMapping(value = "/ContributionContent.do", method = RequestMethod.POST)
	public void ContributionContent(HttpServletResponse resp, int num) throws Exception {
		ContributionDto list = service.ContributionContent(num);
		Gson json = new Gson();
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(json.toJson(list));
	}

	// 기부 내역 수정폼 가기
	@RequestMapping(value = "/ContributionUpdate.do", method = RequestMethod.POST)
	public void ContributionUpdate(HttpServletResponse resp, int num2) throws Exception {
		ContributionDto list = service.ContributionContent(num2);
		Gson json = new Gson();
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		System.out.println(json.toJson(list));
		out.print(json.toJson(list));
	}

	// 기부내역 수정하기
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String updatedonation(ContributionDto dto) {

		service.updateContribution(dto);

		return "redirect:/mypage.do";
	}

	// Q&A 상세 글 보기
	@RequestMapping(value = "/QandAContent.do", method = RequestMethod.POST)
	public void QandAContent(HttpServletResponse resp, int num) throws Exception {
		QandADto list = service.QandAContent(num);
		Gson json = new Gson();
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(json.toJson(list));
	}

	// 기부내역 삭제
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	public String deletedonation(int contribution_history_idx) {
		service.deleteContribution(contribution_history_idx);
		return "redirect:/mypage.do";
	}

	// 회원정보 수정
	@RequestMapping(value = "/updateUser.do", method = RequestMethod.GET)
	public ModelAndView updateUser(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		int idx = (int) session.getAttribute("user_idx");
		UserCommand list = service.UpdateUser(idx);
		mav.addObject("list", list);
		mav.setViewName("updateUser");
		return mav;
	}

	@InitBinder
	protected void initBinnder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

}
