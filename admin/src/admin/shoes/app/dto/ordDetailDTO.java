package admin.shoes.app.dto;

public class ordDetailDTO {
	private int order_d_no;
	private int pdt_no;
	private int order_no;
	private int order_cnt;
	private int ep_order_point;
	
	
	public int getOrder_d_no() {
		return order_d_no;
	}
	public void setOrder_d_no(int order_d_no) {
		this.order_d_no = order_d_no;
	}
	public int getPdt_no() {
		return pdt_no;
	}
	public void setPdt_no(int pdt_no) {
		this.pdt_no = pdt_no;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getOrder_cnt() {
		return order_cnt;
	}
	public void setOrder_cnt(int order_cnt) {
		this.order_cnt = order_cnt;
	}
	public int getEp_order_point() {
		return ep_order_point;
	}
	public void setEp_order_point(int ep_order_point) {
		this.ep_order_point = ep_order_point;
	}
	@Override
	public String toString() {
		return "ordDetailDTO [order_d_no=" + order_d_no + ", pdt_no=" + pdt_no + ", order_no=" + order_no
				+ ", order_cnt=" + order_cnt + ", ep_order_point=" + ep_order_point + "]";
	}
	
	
}
