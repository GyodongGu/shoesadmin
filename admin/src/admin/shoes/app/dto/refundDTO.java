package admin.shoes.app.dto;

import java.sql.Date;

public class refundDTO {
	private int ord_no;
	private Date refund_date;
	private int refund_point;
	private String refund_reason;
	private String pm_name;
	
	
	
	
	public String getPm_name() {
		return pm_name;
	}
	public void setPm_name(String pm_name) {
		this.pm_name = pm_name;
	}
	public int getOrd_no() {
		return ord_no;
	}
	public void setOrd_no(int ord_no) {
		this.ord_no = ord_no;
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
		return "refundDTO [ord_no=" + ord_no + ", refund_date=" + refund_date + ", refund_point=" + refund_point
				+ ", refund_reason=" + refund_reason + "]";
	}

	
	
}
