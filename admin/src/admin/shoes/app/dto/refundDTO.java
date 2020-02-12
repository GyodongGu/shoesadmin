package admin.shoes.app.dto;

import java.sql.Date;

public class refundDTO {
	private int order_no;
	private Date refund_date;
	private int refund_point;
	private String refund_reason;
	
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public Date getRefund_date() {
		return refund_date;
	}
	public void setRefund_date(Date refund_date) {
		this.refund_date = refund_date;
	}
	public int getRefund_point() {
		return refund_point;
	}
	public void setRefund_point(int refund_point) {
		this.refund_point = refund_point;
	}
	public String getRefund_reason() {
		return refund_reason;
	}
	public void setRefund_reason(String refund_reason) {
		this.refund_reason = refund_reason;
	}
	@Override
	public String toString() {
		return "refundDTO [order_no=" + order_no + ", refund_date=" + refund_date + ", refund_point=" + refund_point
				+ ", refund_reason=" + refund_reason + "]";
	}
	
	
}
