package admin.shoes.app.dto;

public class likeDTO {
	private int rw_no;
	private String pm_id;
	
	public int getRw_no() {
		return rw_no;
	}
	public void setRw_no(int rw_no) {
		this.rw_no = rw_no;
	}
	public String getPm_id() {
		return pm_id;
	}
	public void setPm_id(String pm_id) {
		this.pm_id = pm_id;
	}
	@Override
	public String toString() {
		return "likeDTO [rw_no=" + rw_no + ", pm_id=" + pm_id + "]";
	}
	
	
}
