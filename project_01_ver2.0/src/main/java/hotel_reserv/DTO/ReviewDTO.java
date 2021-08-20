package hotel_reserv.DTO;

public class ReviewDTO {
	String m_id;
	String today;
	String h_name;	
	String service;
	String clean;
	String bang;
	String grade;
	String content;
	String writern;
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getToday() {
		return today;
	}
	public void setToday(String today) {
		this.today = today;
	}
	public String getH_name() {
		return h_name;
	}
	public void setH_name(String h_name) {
		this.h_name = h_name;
	}
	public String getService() {
		return service;
	}
	public void setService(String service) {
		this.service = service;
	}
	public String getClean() {
		return clean;
	}
	public void setClean(String clean) {
		this.clean = clean;
	}
	public String getBang() {
		return bang;
	}
	public void setBang(String bang) {
		this.bang = bang;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWritern() {
		return writern;
	}
	public void setWritern(String writern) {
		this.writern = writern;
	}
	@Override
	public String toString() {
		return "ReviewDTO [m_id=" + m_id + ", today=" + today + ", h_name=" + h_name + ", service=" + service
				+ ", clean=" + clean + ", bang=" + bang + ", grade=" + grade + ", content=" + content + ", writern="
				+ writern + "]";
	}

}