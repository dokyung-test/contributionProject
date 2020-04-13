package contribution.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import contribution.model.Program;
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
	
	public int insertProgram(Program program) {
		int programCount = programCount(program.getOrganization_id());
		//System.out.println("cnt : " + programCount);
		program.setProgram_id(programCount++);
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
	
	public int updateProgram(Program program) {
		return programDao.updateProgram(program);
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
	
	
	//controller에서 이동. 개인회원 & admin 공동이용
	//프로그램상세에서 호출
	public Program getProgramInfo(int program_id, String organization_id) {
		Map<String, Object> programSearchKeyword = new HashMap<String, Object>();
		programSearchKeyword.put("organization_id", organization_id);
		programSearchKeyword.put("program_id", program_id);
		Program pro = requestProgramDetail(programSearchKeyword);
		return pro;
	}
	
	//controller에서 이동. 개인회원 & admin 공동이용	
	//프로그램 배너만 뽑을 때 호출.
	public List<ProgramImage> getProgramBanner(int program_id, String organization_id) {
		Map<String, Object> programSearchKeyword = new HashMap<String, Object>();
		programSearchKeyword.put("organization_id", organization_id);
		programSearchKeyword.put("program_id", program_id);
		return getProgramBanner(programSearchKeyword);
	}
	
	
	public int updateApprovalFlg(String organization_id, int program_id, int approval_flg) {
		return programDao.updateApprovalFlg(organization_id, program_id, approval_flg);
	}
}
