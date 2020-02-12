package admin.shoes.app.dto;

import java.sql.Date;

public class imageDetailDTO {
	private int img_no;
	private String img_name;
	private Date img_date;
	private int img_size;
	private String img_use;
	
	public int getImg_no() {
		return img_no;
	}
	public void setImg_no(int img_no) {
		this.img_no = img_no;
	}
	public String getImg_name() {
		return img_name;
	}
	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	public Date getImg_date() {
		return img_date;
	}
	public void setImg_date(Date img_date) {
		this.img_date = img_date;
	}
	public int getImg_size() {
		return img_size;
	}
	public void setImg_size(int img_size) {
		this.img_size = img_size;
	}
	public String getImg_use() {
		return img_use;
	}
	public void setImg_use(String img_use) {
		this.img_use = img_use;
	}
	@Override
	public String toString() {
		return "imageDetailDTO [img_no=" + img_no + ", img_name=" + img_name + ", img_date=" + img_date + ", img_size="
				+ img_size + ", img_use=" + img_use + "]";
	}
	
	
}
