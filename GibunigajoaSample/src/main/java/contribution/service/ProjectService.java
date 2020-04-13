package contribution.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import contribution.model.ContributionDto;
import contribution.model.ProjectDao;
import contribution.model.QandADto;

@Service
public class ProjectService {

	@Autowired
	ProjectDao dao;

	public void setDao(ProjectDao dao) {
		this.dao = dao;
	}
	
	//기부내역 리스트 보기
	public List<ContributionDto> ContributionList(){
		return dao.ContributionList();
	}
	
	//Q&A 리스트 보기
	public List<QandADto> QandAList(){
		return dao.QandAList();
	}
	
	//기부내역 상세글 보기
	public ContributionDto ContributionContent(int contribution_history_idx){
		return dao.ContributionContent(contribution_history_idx);
	}
	
	//Q&A 상세글 보기
	public QandADto QandAContent(int board_idx){
		return dao.QandAContent(board_idx);
	}
	
	//기부내역 추가
	public int insertContribution(ContributionDto dto) {
		return dao.insertContribution(dto);
	}
	
	//기부내역 수정
	public int updateContribution(ContributionDto dto) {
		return dao.updateContribution(dto);
	}
	
	//기부내역 삭제
	public int deleteContribution(int contribution_history_idx) {
		return dao.deleteContribution(contribution_history_idx);
	}
	
	//Q&A 추가
	public int insertQandA(QandADto dto) {
		return dao.insertQandA(dto);
	}
}
