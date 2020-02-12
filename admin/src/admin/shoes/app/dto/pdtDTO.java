package admin.shoes.app.dto;

import java.sql.Date;

public class pdtDTO {
	private int pdt_no;
	private String sm_id;
	private String pdt_type_cd;
	private String pdt_king_cd;
	private String gender_cd;
	private int pdt_price;
	private String pdt_stat_cd;
	private Date pdt_date;
	public int getPdt_no() {
		return pdt_no;
	}
	public void setPdt_no(int pdt_no) {
		this.pdt_no = pdt_no;
	}
	public String getSm_id() {
		return sm_id;
	}
	public void setSm_id(String sm_id) {
		this.sm_id = sm_id;
	}
	public String getPdt_type_cd() {
		return pdt_type_cd;
	}
	public void setPdt_type_cd(String pdt_type_cd) {
		this.pdt_type_cd = pdt_type_cd;
	}
	public String getPdt_king_cd() {
		return pdt_king_cd;
	}
	public void setPdt_king_cd(String pdt_king_cd) {
		this.pdt_king_cd = pdt_king_cd;
	}
	public String getGender_cd() {
		return gender_cd;
	}
	public void setGender_cd(String gender_cd) {
		this.gender_cd = gender_cd;
	}
	public int getPdt_price() {
		return pdt_price;
	}
	public void setPdt_price(int pdt_price) {
		this.pdt_price = pdt_price;
	}
	public String getPdt_stat_cd() {
		return pdt_stat_cd;
	}
	public void setPdt_stat_cd(String pdt_stat_cd) {
		this.pdt_stat_cd = pdt_stat_cd;
	}
	public Date getPdt_date() {
		return pdt_date;
	}
	public void setPdt_date(Date pdt_date) {
		this.pdt_date = pdt_date;
	}
	
	@Override
	public String toString() {
		return "pdtDTO [pdt_no=" + pdt_no + ", sm_id=" + sm_id + ", pdt_type_cd=" + pdt_type_cd + ", pdt_king_cd="
				+ pdt_king_cd + ", gender_cd=" + gender_cd + ", pdt_price=" + pdt_price + ", pdt_stat_cd=" + pdt_stat_cd
				+ ", pdt_date=" + pdt_date + "]";
	}
		
}
