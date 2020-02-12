package admin.shoes.app.dto;

public class imageDTO {
	private int img_no;
	private String section;
	private String section_no;
	
	public int getImg_no() {
		return img_no;
	}
	public void setImg_no(int img_no) {
		this.img_no = img_no;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getSection_no() {
		return section_no;
	}
	public void setSection_no(String section_no) {
		this.section_no = section_no;
	}
	@Override
	public String toString() {
		return "imageDTO [img_no=" + img_no + ", section=" + section + ", section_no=" + section_no + "]";
	}
	
	
}
