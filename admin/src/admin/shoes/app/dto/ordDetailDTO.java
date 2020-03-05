package admin.shoes.app.dto;

public class ordDetailDTO {
	private int order_detail_no;
	private int ord_size;
	private String ord_color;
	private int ord_cnt;
	private int ord_detail_point;
	private int ord_no;
	
	public int getOrder_detail_no() {
		return order_detail_no;
	}
	public void setOrder_detail_no(int order_detail_no) {
		this.order_detail_no = order_detail_no;
	}
	public int getOrd_size() {
		return ord_size;
	}
	public void setOrd_size(int ord_size) {
		this.ord_size = ord_size;
	}
	public String getOrd_color() {
		return ord_color;
	}
	public void setOrd_color(String ord_color) {
		this.ord_color = ord_color;
	}
	public int getOrd_cnt() {
		return ord_cnt;
	}
	public void setOrd_cnt(int ord_cnt) {
		this.ord_cnt = ord_cnt;
	}
	public int getOrd_detail_point() {
		return ord_detail_point;
	}
	public void setOrd_detail_point(int ord_detail_point) {
		this.ord_detail_point = ord_detail_point;
	}
	public int getOrd_no() {
		return ord_no;
	}
	public void setOrd_no(int ord_no) {
		this.ord_no = ord_no;
	}
	
	@Override
	public String toString() {
		return "ordDetailDTO [order_detail_no=" + order_detail_no + ", ord_size=" + ord_size + ", ord_color="
				+ ord_color + ", ord_cnt=" + ord_cnt + ", ord_detail_point=" + ord_detail_point + ", ord_no=" + ord_no
				+ "]";
	}
	
	
	
}
