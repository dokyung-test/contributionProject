package contribution.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import contribution.model.Program;
import contribution.model.ProgramBannerDao;
import contribution.model.ProgramBannerDto;
import contribution.model.ProgramDao;
import contribution.model.ProgramImage;
import contribution.model.ProgramImageDao;
import contribution.model.Type;
import contribution.model.TypeDao;

@Service
public class programService {

	@Autowired
	ProgramDao programDao;
	
	@Autowired
	TypeDao typeDao;
	
	@Autowired
	ProgramImageDao programImageDao;
	
	@Autowired
	ProgramBannerDao programBannerDao;
	
	@Autowired
	public void setProgramImageDao(ProgramImageDao programImageDao) {
		this.programImageDao = programImageDao;
	}

	@Autowired
	public void setProgramDao(ProgramDao programDao) {
		this.programDao = programDao;
	}
	
	@Autowired
	public void setTypeDao(TypeDao typeDao) {
		this.typeDao = typeDao;
	}
	
	@Autowired
	public void setProgramBannerDao(ProgramBannerDao programBannerDao) {
		this.programBannerDao = programBannerDao;
	}

	
	public int insertProgram(Program program) {
		int programCount = programCount(program.getOrganization_id());
		//System.out.println("cnt : " + programCount);
		program.setProgram_id(programCount);
		//System.out.println(program.getProgram_id());
		return programDao.insertProgram(program);
	}
	
	public List<Type> selectTypes(){
		return typeDao.selectTypes();
	}
	
	public int programCount(String organization_id) {
		return programDao.programCount(organization_id);
	}
	
	public List<Program> requestProgramList(String organization_id){
		return programDao.requestProgramList(organization_id); 
	}
	
	public Program requestProgramDetail(Map<String, Object> map) {
		return programDao.requestProgramDetail(map);
	}
	
	public String selectTypeValue(int type_id) {
		return typeDao.selectTypeValue(type_id);
	}
	
	//미승인프로그램수정 - 배너, 이미지 접근불가
	public int updateProgram(Program program) {
		return programDao.updateProgram(program);
	}
	
	//승인프로그램수정 - 배너, 이미지 접근가능
	public int updateProgramApproval(Program program) {
		return programDao.updateProgramApproval(program);
	}
		
	
	//배너를 program_images에서 보관하다가 수정 -> program테이블로 이동. 사용하지 않는 메서드
	/*
	 * public int insertProgramBanner(ProgramImage imageInfo) { return
	 * programDao.insertProgramBanner(imageInfo); }
	 */
	
	public int insertProgramImage(ProgramImage imageInfo) { 
		return programDao.insertProgramBanner(imageInfo); 
	}
	
	public List<ProgramImage> getProgramBanner(Map<String, Object> map) {
		return programImageDao.getProgramBanner(map);
	}
	
	public List<Program> selectAllProgramList() {
		return programDao.selectAllProgramList();
	}
	
	public Map<String, Object> makeMap(int program_id, String organization_id){
		Map<String, Object> programSearchKeyword = new HashMap<String, Object>();
		programSearchKeyword.put("organization_id", organization_id);
		programSearchKeyword.put("program_id", program_id);
		return programSearchKeyword;
	}
	
	
	//controller에서 이동. 개인회원 & admin 공동이용
	//프로그램상세에서 호출
	public Program getProgramInfo(int program_id, String organization_id) {
		/*
		 * Map<String, Object> programSearchKeyword = new HashMap<String, Object>();
		 * programSearchKeyword.put("organization_id", organization_id);
		 * programSearchKeyword.put("program_id", program_id);
		 */
		Program pro = requestProgramDetail(makeMap(program_id, organization_id));
		return pro;
	}
	
	//controller에서 이동. 개인회원 & admin 공동이용	
	//프로그램 배너만 뽑을 때 호출.
	public List<ProgramImage> getProgramBanner(int program_id, String organization_id) {
		/*
		 * Map<String, Object> programSearchKeyword = new HashMap<String, Object>();
		 * programSearchKeyword.put("organization_id", organization_id);
		 * programSearchKeyword.put("program_id", program_id);
		 */
		return getProgramBanner(makeMap(program_id, organization_id));
	}
	
	public int calcTargetAmount(Map<String, Object> programSearchKeyword) {
		return programDao.calcTargetAmount(programSearchKeyword);
	}
	
	
	public int updateApprovalFlg(String organization_id, int program_id, int approval_flg) {
		return programDao.updateApprovalFlg(organization_id, program_id, approval_flg);
	}
	
	public int updateReadcount(Map<String, Object> programSearchKeyword) {
		return programDao.updateReadcount(programSearchKeyword);
	}
	
	
	//개인회원용 -분야별 모집프로그램리스트
	public List<ProgramBannerDto> getTypeProgramList(int type_id) {
		return programBannerDao.getTypeProgramList(type_id);
	}
	
	//개인회원용 -전체분야의 모집프로그램리스트
	public List<ProgramBannerDto> getAllProgramList() {
		return programBannerDao.getAllProgramList();
	}
	
	//프로그램 전체 이미지 습득
	public List<String> getAllImages(int program_id, String organization_id){
		return programDao.getAllImages(makeMap(program_id, organization_id));
	}
	
	//프로그램상세 - 기부단체이름습득
	public String getOrganizationName(String organization_id) {
		return programDao.getOrganizationName(organization_id);
	}
	
	//승인프로그램 수정시 필요한 이미지들의 원본파일명습득
	public List<String> getProgramOriginalFileName(int program_id, String organization_id) {
		return programImageDao.getProgramOriginalFileName(makeMap(program_id, organization_id));
	}
	
}
