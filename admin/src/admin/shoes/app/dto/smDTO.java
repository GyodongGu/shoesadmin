package admin.shoes.app.dto;

import java.sql.Date;
import java.util.List;

public class smDTO {
	private String sm_id;
	private String shop_name;
	private String sm_pw;
	private String sm_name;
	private String sm_tell;
	private String business_no;
	private Date sm_date;
	private String sm_post;
	private String sm_addr1;
	private String sm_addr2;
	private String sm_addr3;
	private String sm_stat_cd;
	private String mgr_auth_cd;
	private String sm_remark;
	private String sm_time;
	private String sm_rest;
	private List<imageDetailDTO> img_name;
	
	
	public List<imageDetailDTO> getImg_name() {
		return img_name;
	}
	public void setImg_name(List<imageDetailDTO> img_name) {
		this.img_name = img_name;
	}
	public String getSm_time() {
		return sm_time;
	}
	public void setSm_time(String sm_time) {
		this.sm_time = sm_time;
	}
	public String getSm_rest() {
		return sm_rest;
	}
	public void setSm_rest(String sm_rest) {
		this.sm_rest = sm_rest;
	}
	public String getSm_id() {
		return sm_id;
	}
	public void setSm_id(String sm_id) {
		this.sm_id = sm_id;
	}
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	public String getSm_pw() {
		return sm_pw;
	}
	public void setSm_pw(String sm_pw) {
		this.sm_pw = sm_pw;
	}
	public String getSm_name() {
		return sm_name;
	}
	public void setSm_name(String sm_name) {
		this.sm_name = sm_name;
	}
	public String getSm_tell() {
		return sm_tell;
	}
	public void setSm_tell(String sm_tell) {
		this.sm_tell = sm_tell;
	}
	public String getBusiness_no() {
		return business_no;
	}
	public void setBusiness_no(String business_no) {
		this.business_no = business_no;
	}
	public Date getSm_date() {
		return sm_date;
	}
	public void setSm_date(Date sm_date) {
		this.sm_date = sm_date;
	}
	public String getSm_post() {
		return sm_post;
	}
	public void setSm_post(String sm_post) {
		this.sm_post = sm_post;
	}
	public String getSm_addr1() {
		return sm_addr1;
	}
	public void setSm_addr1(String sm_addr1) {
		this.sm_addr1 = sm_addr1;
	}
	public String getSm_addr2() {
		return sm_addr2;
	}
	public void setSm_addr2(String sm_addr2) {
		this.sm_addr2 = sm_addr2;
	}
	public String getSm_addr3() {
		return sm_addr3;
	}
	public void setSm_addr3(String sm_addr3) {
		this.sm_addr3 = sm_addr3;
	}
	public String getSm_stat_cd() {
		return sm_stat_cd;
	}
	public void setSm_stat_cd(String sm_stat_cd) {
		this.sm_stat_cd = sm_stat_cd;
	}
	public String getMgr_auth_cd() {
		return mgr_auth_cd;
	}
	public void setMgr_auth_cd(String mgr_auth_cd) {
		this.mgr_auth_cd = mgr_auth_cd;
	}
	public String getSm_remark() {
		return sm_remark;
	}
	public void setSm_remark(String sm_remark) {
		this.sm_remark = sm_remark;
	}
	
	@Override
	public String toString() {
		return "smDTO [sm_id=" + sm_id + ", shop_name=" + shop_name + ", sm_pw=" + sm_pw + ", sm_name=" + sm_name
				+ ", sm_tell=" + sm_tell + ", business_no=" + business_no + ", sm_date=" + sm_date + ", sm_post="
				+ sm_post + ", sm_addr1=" + sm_addr1 + ", sm_addr2=" + sm_addr2 + ", sm_addr3=" + sm_addr3
				+ ", sm_stat_cd=" + sm_stat_cd + ", mgr_auth_cd=" + mgr_auth_cd + ", sm_remark=" + sm_remark
				+ ", sm_time=" + sm_time + ", sm_rest=" + sm_rest + "]";
	}

	
}
