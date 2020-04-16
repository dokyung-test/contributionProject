package contribution.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class CommentDao extends SqlSessionDaoSupport{

	
	//block되지 않은 프로그램의 모든 댓글습득
	public List<CommentViewDto> getAllComment(Map<String, Object> map){
		return getSqlSession().selectList("comment.getAllComment", map);
	}
	
	//댓글등록시 필요한 comment_id세팅
	public int getCommentId(Map<String, Object> map) {
		return getSqlSession().selectOne("comment.selectCommentId");
	}
	
	//댓글등록
	public int insertComment(Comment comment) {
		return getSqlSession().insert("comment.insertComment", comment);
	}
	
	//댓글신고 || alert후에 notify_flg변경시 
	public int updateAlertComment(Comment comment) {
		return getSqlSession().update("comment.alertComment", comment);
	}
	
	//신고 5회로 완전 block처리 & 
	public int updateBlockComment(Comment comment) {
		return getSqlSession().update("comment.blockComment", comment);
	}
	
	//댓글신고 insert
	public int insertReportComment(ReportComment reportComment) {
		return getSqlSession().insert("comment.insertReportComment", reportComment);
	}
	
	
	
	
	
	
}
