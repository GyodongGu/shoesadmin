package admin.shoes.app.dto;

import java.sql.Date;
import java.util.List;

public class pdtDTO {
	private int pdt_no;
	private String sm_id;
	private String pdt_name;
	private String pdt_type_cd;
	private String pdt_kind_cd;
	private String gender_cd;
	private int pdt_price;
	private String pdt_stat_cd;
	private Date pdt_date;
	private List<imageDetailDTO>img_name;
	private String pdt_kind_name;
	private int pdt_size_cd;
	private String pdt_color_cd;
	private String pdt_remark;
	
	
	
	
	public String getPdt_remark() {
		return pdt_remark;
	}
	public void setPdt_remark(String pdt_remark) {
		this.pdt_remark = pdt_remark;
	}
	public int getPdt_size_cd() {
		return pdt_size_cd;
	}
	public void setPdt_size_cd(int pdt_size_cd) {
		this.pdt_size_cd = pdt_size_cd;
	}
	public String getPdt_color_cd() {
		return pdt_color_cd;
	}
	public void setPdt_color_cd(String pdt_color_cd) {
		this.pdt_color_cd = pdt_color_cd;
	}
	public String getPdt_kind_name() {
		return pdt_kind_name;
	}
	public void setPdt_kind_name(String pdt_kind_name) {
		this.pdt_kind_name = pdt_kind_name;
	}
	public List<imageDetailDTO> getImg_name() {
		return img_name;
	}
	public void setImg_name(List<imageDetailDTO> img_name) {
		this.img_name = img_name;
	}
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
	public String getPdt_name() {
		return pdt_name;
	}
	public void setPdt_name(String pdt_name) {
		this.pdt_name = pdt_name;
	}
	public String getPdt_type_cd() {
		return pdt_type_cd;
	}
	public void setPdt_type_cd(String pdt_type_cd) {
		this.pdt_type_cd = pdt_type_cd;
	}
	public String getPdt_kind_cd() {
		return pdt_kind_cd;
	}
	public void setPdt_kind_cd(String pdt_kind_cd) {
		this.pdt_kind_cd = pdt_kind_cd;
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
		return "pdtDTO [pdt_no=" + pdt_no + ", sm_id=" + sm_id + ", pdt_name=" + pdt_name + ", pdt_type_cd="
				+ pdt_type_cd + ", pdt_kind_cd=" + pdt_kind_cd + ", gender_cd=" + gender_cd + ", pdt_price=" + pdt_price
				+ ", pdt_stat_cd=" + pdt_stat_cd + ", pdt_date=" + pdt_date + ", img_name=" + img_name
				+ ", pdt_kind_name=" + pdt_kind_name + ", pdt_size_cd=" + pdt_size_cd + ", pdt_color_cd=" + pdt_color_cd
				+ ", pdt_remark=" + pdt_remark + "]";
	}

		
}


