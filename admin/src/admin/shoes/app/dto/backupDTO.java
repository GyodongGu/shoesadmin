package admin.shoes.app.dto;

import java.sql.Date;

public class backupDTO {
	private int order_no;
	private Date order_date;
	private int order_cnt;
	private int order_point;
	private String order_stat_cd;
	private String group_dlvy_cd;
	private int ep_order_point;
	private int refund_point;
	private Date refund_date;
	
	
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public int getOrder_cnt() {
		return order_cnt;
	}
	public void setOrder_cnt(int order_cnt) {
		this.order_cnt = order_cnt;
	}
	public int getOrder_point() {
		return order_point;
	}
	public void setOrder_point(int order_point) {
		this.order_point = order_point;
	}
	public String getOrder_stat_cd() {
		return order_stat_cd;
	}
	public void setOrder_stat_cd(String order_stat_cd) {
		this.order_stat_cd = order_stat_cd;
	}
	public String getGroup_dlvy_cd() {
		return group_dlvy_cd;
	}
	public void setGroup_dlvy_cd(String group_dlvy_cd) {
		this.group_dlvy_cd = group_dlvy_cd;
	}
	public int getEp_order_point() {
		return ep_order_point;
	}
	public void setEp_order_point(int ep_order_point) {
		this.ep_order_point = ep_order_point;
	}
	public int getRefund_point() {
		return refund_point;
	}
	public void setRefund_point(int refund_point) {
		this.refund_point = refund_point;
	}
	public Date getRefund_date() {
		return refund_date;
	}
	public void setRefund_date(Date refund_date) {
		this.refund_date = refund_date;
	}
	@Override
	public String toString() {
		return "backupDTO [order_no=" + order_no + ", order_date=" + order_date + ", order_cnt=" + order_cnt
				+ ", order_point=" + order_point + ", order_stat_cd=" + order_stat_cd + ", group_dlvy_cd="
				+ group_dlvy_cd + ", ep_order_point=" + ep_order_point + ", refund_point=" + refund_point
				+ ", refund_date=" + refund_date + "]";
	}
	
	
	
}
