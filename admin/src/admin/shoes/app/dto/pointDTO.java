package admin.shoes.app.dto;

import java.sql.Date;

public class pointDTO {
	private int pm_no;
	private int point_charge;
	private Date point_date;
	private String point_type_cd;
	
	public int getPm_no() {
		return pm_no;
	}
	public void setPm_no(int pm_no) {
		this.pm_no = pm_no;
	}
	public int getPoint_charge() {
		return point_charge;
	}
	public void setPoint_charge(int point_charge) {
		this.point_charge = point_charge;
	}
	public Date getPoint_date() {
		return point_date;
	}
	public void setPoint_date(Date point_date) {
		this.point_date = point_date;
	}
	public String getPoint_type_cd() {
		return point_type_cd;
	}
	public void setPoint_type_cd(String point_type_cd) {
		this.point_type_cd = point_type_cd;
	}
	@Override
	public String toString() {
		return "pointDTO [pm_no=" + pm_no + ", point_charge=" + point_charge + ", point_date=" + point_date
				+ ", point_type_cd=" + point_type_cd + "]";
	}
	
	
}
