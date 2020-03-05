package admin.shoes.app.dto;

import java.sql.Date;

public class payHistoryDTO {
	private int order_no;
	private Date pay_date;
	private int pay_point;
	
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	public int getPay_point() {
		return pay_point;
	}
	public void setPay_point(int pay_point) {
		this.pay_point = pay_point;
	}
	@Override
	public String toString() {
		return "payHistoryDTO [order_no=" + order_no + ", pay_date=" + pay_date + ", pay_point=" + pay_point + "]";
	}
	
	
}
