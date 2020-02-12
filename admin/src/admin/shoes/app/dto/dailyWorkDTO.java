package admin.shoes.app.dto;

import java.sql.Date;

public class dailyWorkDTO {
	private String sm_id;
	private Date rest_date;
	
	public String getSm_id() {
		return sm_id;
	}
	public void setSm_id(String sm_id) {
		this.sm_id = sm_id;
	}
	public Date getRest_date() {
		return rest_date;
	}
	public void setRest_date(Date rest_date) {
		this.rest_date = rest_date;
	}
	@Override
	public String toString() {
		return "dailyWorkDTO [sm_id=" + sm_id + ", rest_date=" + rest_date + "]";
	}
	
	
}
