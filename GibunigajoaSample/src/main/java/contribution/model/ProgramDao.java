package contribution.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class ProgramDao extends SqlSessionDaoSupport{

	public int insertProgram(Program program) {
		return getSqlSession().insert("program.insertProgram", program);
	}
	
	public int programCount(String organization_id) {
		return getSqlSession().selectOne("program.selectProgramCount", organization_id);
	}
	
	public List<Program> requestProgramList(String organization_id){
		return getSqlSession().selectList("organization.selectRequestProgramList", organization_id);
	}
	
	public Program requestProgramDetail(Map<String, Object> map) {
		return getSqlSession().selectOne("program.selectProgram", map);
	}
	
	public int updateProgram(Program program) {
		return getSqlSession().update("program.updateProgram", program);
	}
	
	//배너이미지 insert
	public int insertProgramBanner(ProgramImage imageInfo) {
		return getSqlSession().insert("program.insertProgramImage", imageInfo);
	}
	
	public List<Program> selectAllProgramList() {
		return getSqlSession().selectList("program.selectAllRequestProgramList");
	}
	
	public int updateApprovalFlg(String organization_id, int program_id, int approval_flg) {
		Map<String, Object> approvalInfo = new HashMap<String, Object>();
		approvalInfo.put("program_id", program_id);
		approvalInfo.put("organization_id", organization_id);
		approvalInfo.put("approval_flg", approval_flg);
		return getSqlSession().update("program.updateApprovalFlg", approvalInfo);
	}
	
	public int calcTargetAmount(Map<String, Object> programSearchKeyword) {
		int totalAmount = 0;
		if(getSqlSession().selectOne("program.calcTargetAmount", programSearchKeyword) != null) {
			totalAmount = getSqlSession().selectOne("program.calcTargetAmount", programSearchKeyword);
		}
		return totalAmount;
	}
	
	//프로그램 조회수 올리기
	public int updateReadcount(Map<String, Object> programSearchKeyword) {
		return getSqlSession().update("program.updateProgramReadcount", programSearchKeyword);
	}
	
	//프로그램 전체 이미지 습득
	public List<String> getAllImages(Map<String, Object> programSearchKeyword){
		return getSqlSession().selectList("program.selectProgramImages", programSearchKeyword);
	}
	
	//프로그램상세 - 기부단체이름습득
	public String getOrganizationName(String organization_id) {
		return getSqlSession().selectOne("program.getOrganizationName", organization_id);
	}
	
	
}
