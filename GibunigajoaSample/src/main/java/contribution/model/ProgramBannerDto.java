package contribution.model;

public class ProgramBannerDto {

	String organization_id;
	int program_id;
	String program_subject;
	String summary;
	
	
	public String getOrganization_id() {
		return organization_id;
	}
	public void setOrganization_id(String organization_id) {
		this.organization_id = organization_id;
	}
	public int getProgram_id() {
		return program_id;
	}
	public void setProgram_id(int program_id) {
		this.program_id = program_id;
	}
	public String getProgram_subject() {
		return program_subject;
	}
	public void setProgram_subject(String program_subject) {
		this.program_subject = program_subject;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	
	
}
