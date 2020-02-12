package admin.shoes.app.dto;

public class bookmarkDTO {
	private int pdt_code;
	private String pdt_pick;
	
	public int getPdt_code() {
		return pdt_code;
	}
	public void setPdt_code(int pdt_code) {
		this.pdt_code = pdt_code;
	}
	public String getPdt_pick() {
		return pdt_pick;
	}
	public void setPdt_pick(String pdt_pick) {
		this.pdt_pick = pdt_pick;
	}
	@Override
	public String toString() {
		return "bookmarkDTO [pdt_code=" + pdt_code + ", pdt_pick=" + pdt_pick + "]";
	}
	
	
}
