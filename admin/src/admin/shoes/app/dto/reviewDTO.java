package admin.shoes.app.dto;

import java.sql.Date;
import java.util.List;

public class reviewDTO {
	private int rw_no;
	private int pdt_no;
	private String pm_id;
	private int rw_cnt;
	private int rw_stars;
	private Date rw_date;
	private String rw_content;
	private List<imageDetailDTO> img_name;
	private likeDTO likeview;
	
	
	
	public likeDTO getLikeview() {
		return likeview;
	}
	public void setLikeview(likeDTO likeview) {
		this.likeview = likeview;
	}
	public List<imageDetailDTO> getImg_name() {
		return img_name;
	}
	public void setImg_name(List<imageDetailDTO> img_name) {
		this.img_name = img_name;
	}
	public int getRw_no() {
		return rw_no;
	}
	public void setRw_no(int rw_no) {
		this.rw_no = rw_no;
	}
	public int getPdt_no() {
		return pdt_no;
	}
	public void setPdt_no(int pdt_no) {
		this.pdt_no = pdt_no;
	}
	public String getPm_id() {
		return pm_id;
	}
	public void setPm_id(String pm_id) {
		this.pm_id = pm_id;
	}
	public int getRw_cnt() {
		return rw_cnt;
	}
	public void setRw_cnt(int rw_cnt) {
		this.rw_cnt = rw_cnt;
	}
	public int getRw_stars() {
		return rw_stars;
	}
	public void setRw_stars(int rw_stars) {
		this.rw_stars = rw_stars;
	}
	public Date getRw_date() {
		return rw_date;
	}
	public void setRw_date(Date rw_date) {
		this.rw_date = rw_date;
	}
	public String getRw_content() {
		return rw_content;
	}
	public void setRw_content(String rw_content) {
		this.rw_content = rw_content;
	}
	@Override
	public String toString() {
		return "reviewDTO [rw_no=" + rw_no + ", pdt_no=" + pdt_no + ", pm_id=" + pm_id + ", rw_cnt=" + rw_cnt
				+ ", rw_stars=" + rw_stars + ", rw_date=" + rw_date + ", rw_content=" + rw_content + "]";
	}
	
	
}
