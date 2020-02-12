package admin.shoes.app.dto;

import java.sql.Date;

public class ordDTO {
	private int ord_no;
	private int pm_no;
	private Date ord_date;
	private int ord_point;
	private String ord_stat_cd;
	private String group_dlvy_cd;
	
	public int getOrd_no() {
		return ord_no;
	}
	public void setOrd_no(int ord_no) {
		this.ord_no = ord_no;
	}
	public int getPm_no() {
		return pm_no;
	}
	public void setPm_no(int pm_no) {
		this.pm_no = pm_no;
	}
	public Date getOrd_date() {
		return ord_date;
	}
	public void setOrd_date(Date ord_date) {
		this.ord_date = ord_date;
	}
	public int getOrd_point() {
		return ord_point;
	}
	public void setOrd_point(int ord_point) {
		this.ord_point = ord_point;
	}
	public String getOrd_stat_cd() {
		return ord_stat_cd;
	}
	public void setOrd_stat_cd(String ord_stat_cd) {
		this.ord_stat_cd = ord_stat_cd;
	}
	public String getGroup_dlvy_cd() {
		return group_dlvy_cd;
	}
	public void setGroup_dlvy_cd(String group_dlvy_cd) {
		this.group_dlvy_cd = group_dlvy_cd;
	}
	@Override
	public String toString() {
		return "ordDTO [ord_no=" + ord_no + ", pm_no=" + pm_no + ", ord_date=" + ord_date + ", ord_point=" + ord_point
				+ ", ord_stat_cd=" + ord_stat_cd + ", group_dlvy_cd=" + group_dlvy_cd + "]";
	}
	
	
}
