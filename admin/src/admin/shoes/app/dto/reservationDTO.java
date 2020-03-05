package admin.shoes.app.dto;

import java.sql.Date;

public class reservationDTO {
	private int res_no;
	
	private String sm_id;
	private Date res_date;
	private String res_remark;
	private int pm_no;
	
	private String reserv_date;
	
	
	
	public String getReserv_date() {
		return reserv_date;
	}
	public void setReserv_date(String reserv_date) {
		this.reserv_date = reserv_date;
	}
	public int getRes_no() {
		return res_no;
	}
	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}

	public int getPm_no() {
		return pm_no;
	}
	public void setPm_no(int pm_no) {
		this.pm_no = pm_no;
	}
	public String getSm_id() {
		return sm_id;
	}
	public void setSm_id(String sm_id) {
		this.sm_id = sm_id;
	}
	public Date getRes_date() {
		return res_date;
	}
	public void setRes_date(Date res_date) {
		this.res_date = res_date;
	}
	public String getRes_remark() {
		return res_remark;
	}
	public void setRes_remark(String res_remark) {
		this.res_remark = res_remark;
	}
	
	@Override
	public String toString() {
		return "reservationDTO [res_no=" + res_no + ", sm_id=" + sm_id + ", res_date=" + res_date + ", res_remark="
				+ res_remark + ", pm_no=" + pm_no + "]";
	}

	
}
