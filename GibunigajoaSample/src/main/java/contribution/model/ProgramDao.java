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
}
