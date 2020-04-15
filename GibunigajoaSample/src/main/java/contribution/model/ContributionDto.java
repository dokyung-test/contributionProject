package contribution.model;

import java.util.Date;

public class ContributionDto {

	private int contribution_history_idx;
	private int user_idx; //회원 id
	private String organization_name; //기관명 
	private String program_name; //프로그램명
	private Date date; //날짜
	private int contribution; //금액
	private String note; //비고
	private int register_type_flg; //등록구분 (자동,수동 등록)
	
	public ContributionDto() {}
	
	public ContributionDto(int contribution_history_idx, int user_idx, String organization_name, String program_name,
			Date date,  int contribution, String note, int register_type_flg) {
		super();
		this.contribution_history_idx = contribution_history_idx;
		this.user_idx = user_idx;
		this.organization_name = organization_name;
		this.program_name = program_name;
		this.date = date;
	
		this.contribution = contribution;
		this.note = note;
		this.register_type_flg = register_type_flg;
	}
	public int getContribution_history_idx() {
		return contribution_history_idx;
	}
	public void setContribution_history_idx(int contribution_history_idx) {
		this.contribution_history_idx = contribution_history_idx;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getOrganization_name() {
		return organization_name;
	}
	public void setOrganization_name(String organization_name) {
		this.organization_name = organization_name;
	}
	public String getProgram_name() {
		return program_name;
	}
	public void setProgram_name(String program_name) {
		this.program_name = program_name;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}

	public int getContribution() {
		return contribution;
	}
	public void setContribution(int contribution) {
		this.contribution = contribution;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public int getRegister_type_flg() {
		return register_type_flg;
	}
	public void setRegister_type_flg(int register_type_flg) {
		this.register_type_flg = register_type_flg;
	}
	
	
	
	
}
