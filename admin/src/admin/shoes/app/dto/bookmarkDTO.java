package admin.shoes.app.dto;

public class bookmarkDTO {
	private int pm_no;
	private int pdt_no;
	private pdtDTO pdt_name;
	private imageDetailDTO img_name;
	
	public int getPm_no() {
		return pm_no;
	}
	public void setPm_no(int pm_no) {
		this.pm_no = pm_no;
	}
	public int getPdt_no() {
		return pdt_no;
	}
	public void setPdt_no(int pdt_no) {
		this.pdt_no = pdt_no;
	}
	public pdtDTO getPdt_name() {
		return pdt_name;
	}
	public void setPdt_name(pdtDTO pdt_name) {
		this.pdt_name = pdt_name;
	}
	public imageDetailDTO getImg_name() {
		return img_name;
	}
	public void setImg_name(imageDetailDTO img_name) {
		this.img_name = img_name;
	}
	@Override
	public String toString() {
		return "bookmarkDTO [pm_no=" + pm_no + ", pdt_no=" + pdt_no + ", pdt_name=" + pdt_name + ", img_name="
				+ img_name + "]";
	}
}
