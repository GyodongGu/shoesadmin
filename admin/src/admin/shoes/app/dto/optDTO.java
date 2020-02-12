package admin.shoes.app.dto;

public class optDTO {
	private int pdt_no;
	private int pdt_size_cd;
	private String pdt_color_cd;
	
	public int getPdt_no() {
		return pdt_no;
	}
	public void setPdt_no(int pdt_no) {
		this.pdt_no = pdt_no;
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
	
	@Override
	public String toString() {
		return "optDTO [pdt_no=" + pdt_no + ", pdt_size_cd=" + pdt_size_cd + ", pdt_color_cd=" + pdt_color_cd + "]";
	}
	
	
}
