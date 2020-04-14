package contribution.ldk.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import contribution.model.FileUtils;
import contribution.model.Program;
import contribution.model.ProgramImage;
import contribution.model.Type;
import contribution.service.programService;

@Controller
public class contributionController {

	@Autowired
	private programService service;

	public void setService(programService service) {
		this.service = service;
		 
		
		
	}

	// 클래스에 들어올때마다 호출 ->언제나 필요한 경우 아니면 붙이지말자.
	//@ModelAttribute
	/*
	 * public void getTypes(Model model) {
	 * System.out.println("@ModdelAttribute /getTypes");
	 * model.addAttribute("typeList", service.selectTypes()); }
	 */

	@RequestMapping(value = "/registerForm.do", method = RequestMethod.GET)
	public ModelAndView registerForm(HttpSession session) {
		session.setAttribute("organization_id", "00000015");
		ModelAndView mav = new ModelAndView("registerProgram");
		mav.addObject("program", new Program());
		List<Type> typeList = service.selectTypes();
		mav.addObject("typeList", typeList);
		System.out.println("서버경로 : " + session.getServletContext().getRealPath("/"));
		// registerForm페이지에서 commandName과 모델명을 일치 -> 빈 객체를 만들고 안에다 채워넣는다의 느낌.
		return mav;
	}

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	@RequestMapping(value = "/registerProgram.do", method = RequestMethod.POST)
	//요청마다 session이 존재하는 범위이기 때문에, session이 필요한 메서드에서는 요청별 파라미터로 받아서 넘겨준다.
	public ModelAndView registerProgram(@ModelAttribute("program") Program pro, HttpSession session) {
		//pro.setOrganization_id("000000015");
		System.out.println(pro);
		int rowNum = service.insertProgram(pro);
		System.out.println("rowNum : " + rowNum);
		if (rowNum > 0) {
			return requestList(session);
		} else {
			return new ModelAndView("errors/error");
		}
	}
	
	
	//각 기부단체 별 신청한 프로그램 리스트
	@RequestMapping(value = "/requestList.do", method = RequestMethod.GET)
	public ModelAndView requestList(HttpSession session) {
		//session의 organization_id으로 받아옴.
		String organization_id = (String) session.getAttribute("organization_id");
		ModelAndView mav = new ModelAndView("requestProgramList");
		mav.addObject("programLists", service.requestProgramList(organization_id));
		return mav;
	}
	
	//프로그램상세
	@RequestMapping(value = "/showProgram.do", method = RequestMethod.GET)
	public ModelAndView showProgramContent(int program_id, String organization_id) {
		
		ModelAndView mav = new ModelAndView("requestProgramDetail");
		Program pro = service.getProgramInfo(program_id, organization_id);
		mav.addObject("requestProgram", pro);
		mav.addObject("typeValue", service.selectTypeValue(pro.getType_id()));
		List<ProgramImage> images = service.getProgramBanner(program_id, organization_id);
		mav.addObject("images", images);
		mav.addObject("totalAmount", calcTargetAmount(program_id, organization_id));
		return mav;
	}
	
	public int updateReadcount(int program_id, String organization_id) {
		
	}
	
	//기부이력으로 프로그램 기부내역 합계 계산
	public int calcTargetAmount(int program_id, String organization_id) {
		return service.calcTargetAmount(service.makeMap(program_id, organization_id));
	}
	
	//service로 이동
	/*
	 * public Program getProgramInfo(int program_id, String organization_id) {
	 * Map<String, Object> programSearchKeyword = new HashMap<String, Object>();
	 * programSearchKeyword.put("organization_id", organization_id);
	 * programSearchKeyword.put("program_id", program_id); Program pro =
	 * service.requestProgramDetail(programSearchKeyword); return pro; }
	 */
	
	//service로 이동
	/*
	 * public List<ProgramImage> getProgramBanner(int program_id, String
	 * organization_id) { Map<String, Object> programSearchKeyword = new
	 * HashMap<String, Object>(); programSearchKeyword.put("organization_id",
	 * organization_id); programSearchKeyword.put("program_id", program_id); return
	 * service.getProgramBanner(programSearchKeyword); }
	 */
	
	@RequestMapping(value = "/updateForm.do", method = RequestMethod.POST)
	public ModelAndView registerForm(@ModelAttribute Program updateProgram,HttpSession session) {
		ModelAndView mav = new ModelAndView("updateForm");
		Program pro = service.getProgramInfo(updateProgram.getProgram_id(), updateProgram.getOrganization_id());
		mav.addObject("updateProgram", pro);
		List<Type> typeList = service.selectTypes();
		mav.addObject("typeList", typeList);
		// registerForm페이지에서 commandName과 모델명을 일치 -> 빈 객체를 만들고 안에다 채워넣는다의 느낌.
		return mav;
	}
	
	@RequestMapping(value = "/updateProgram.do", method = RequestMethod.POST)
	//요청마다 session이 존재하는 범위이기 때문에, session이 필요한 메서드에서는 요청별 파라미터로 받아서 넘겨준다.
	public ModelAndView updateProgram(@ModelAttribute("requestProgram") Program requestProgram, @RequestParam("banner") MultipartFile banner, @RequestParam("images") List<MultipartFile> programImages,HttpSession session, HttpServletRequest request) {
		String organization_id = (String) session.getAttribute("organization_id");
		int program_id = requestProgram.getProgram_id();
		String root = request.getServletContext().getRealPath("resources/images/");
		String banner_file_name = "";
		if(!banner.isEmpty()) {
			banner_file_name = insertBanner(organization_id, program_id, root, banner);
		}
		requestProgram.setBanner_file_name(banner_file_name);
		int rowNum = service.updateProgram(requestProgram);
		//String root = request.getServletContext().getRealPath("/");//프로젝트 외부에 올린 resource파일에 허용접근불가-보안문제
		
		if (rowNum > 0) {
			System.out.println(programImages);
			for(int i = 0; i <= programImages.size() - 1; i++) {
					if(!programImages.get(i).isEmpty()) {
						System.out.println(programImages.get(i));
						ProgramImage imageInfo = insertImages(organization_id, program_id, root, programImages.get(i));
						service.insertProgramImage(imageInfo);
					}
				}
			return showProgramContent(requestProgram.getProgram_id(), organization_id);
			
		} else {
			return new ModelAndView("errors/error");
		}
	}
	
	//프로그램배너 파일로 출력
	public String insertBanner(String organization_id, int program_id, String root, MultipartFile image) {
		FileUtils fileUtils = new FileUtils();
		return fileUtils.bannerImageUpload(image, organization_id, program_id, root);
		
	}
	
	//프로그램이미지 업로드 후, programImage 객체를 리턴.
	public ProgramImage insertImages(String organization_id, int program_id, String root, MultipartFile image) {
		FileUtils fileUtils = new FileUtils();
		ProgramImage imageInfo = fileUtils.imageUpload(image, organization_id, program_id, root);
		imageInfo.setOrganization_id(organization_id);
		imageInfo.setProgram_id(program_id);
		imageInfo.setImage_url(root);
		return imageInfo;
		
	}
	
	//프로그램 수정용 -이미지공백 후 다시 update
	@RequestMapping(value = "/deleteBanner.do", method = RequestMethod.POST)
	public int deleteBanner(String organization_id, int program_id) {
		int row = 0;
		return row;
	}
	
	
	@RequestMapping(value = "/programList.do", method = RequestMethod.GET)
	public ModelAndView selectProgramList() {
		ModelAndView mav = new ModelAndView("programList");
		mav.addObject("programList", service.selectAllProgramList());
		return mav;
	}
	
	
}
