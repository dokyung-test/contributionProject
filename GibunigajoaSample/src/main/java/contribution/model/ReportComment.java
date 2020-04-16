package contribution.model;

public class ReportComment {

	String organization_id;
	String program_id;
	int user_idx;
	int comment_id;
	int reporter_idx;
	int block_flg;
	
	
	public String getOrganization_id() {
		return organization_id;
	}
	public void setOrganization_id(String organization_id) {
		this.organization_id = organization_id;
	}
	public String getProgram_id() {
		return program_id;
	}
	public void setProgram_id(String program_id) {
		this.program_id = program_id;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public int getReporter_idx() {
		return reporter_idx;
	}
	public void setReporter_idx(int reporter_idx) {
		this.reporter_idx = reporter_idx;
	}
	public int getBlock_flg() {
		return block_flg;
	}
	public void setBlock_flg(int block_flg) {
		this.block_flg = block_flg;
	}
	
	
}
