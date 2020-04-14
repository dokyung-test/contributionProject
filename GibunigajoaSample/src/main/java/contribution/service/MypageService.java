package contribution.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import contribution.model.ContributionDto;
import contribution.model.MypageDao;
import contribution.model.QandADto;

@Service
public class MypageService {

	@Autowired
	MypageDao dao;

	public void setDao(MypageDao dao) {
		this.dao = dao;
	}
	
	//기부내역 리스트 보기
	public List<ContributionDto> ContributionList(int user_idx){
		return dao.ContributionList(user_idx);
	}
	
	//Q&A 리스트 보기
	public List<QandADto> QandAList(int user_idx){
		return dao.QandAList(user_idx);
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
