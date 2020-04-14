package contribution.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class ProgramBannerDao extends SqlSessionDaoSupport{

	//개인회원용 -전체분야의 모집프로그램리스트
		public List<ProgramBannerDto> getAllProgramList() {
			System.out.println(getSqlSession().selectList("program.getAllProgramList"));
			return getSqlSession().selectList("program.getAllProgramList");
		}
	
	//개인회원용 -분야별 모집프로그램리스트
		public List<ProgramBannerDto> getTypeProgramList(int type_id) {
			return getSqlSession().selectList("program.getTypeProgramList", type_id);
		}
	
}
