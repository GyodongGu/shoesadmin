package admin.shoes.app.dto;

import java.sql.Date;

public class deliveryDTO {
	private int order_d_no;
	private int invoice_no;
	private Date dlvy_date;
	private String dlvy_name;
	private int dlvy_tell;
	private int dlvy_post;
	private String dlvy_addr1;
	private String dlvy_addr2;
	private String dlvy_remark;
	
	public int getOrder_d_no() {
		return order_d_no;
	}
	public void setOrder_d_no(int order_d_no) {
		this.order_d_no = order_d_no;
	}
	public int getInvoice_no() {
		return invoice_no;
	}
	public void setInvoice_no(int invoice_no) {
		this.invoice_no = invoice_no;
	}
	public Date getDlvy_date() {
		return dlvy_date;
	}
	public void setDlvy_date(Date dlvy_date) {
		this.dlvy_date = dlvy_date;
	}
	public String getDlvy_name() {
		return dlvy_name;
	}
	public void setDlvy_name(String dlvy_name) {
		this.dlvy_name = dlvy_name;
	}
	public int getDlvy_tell() {
		return dlvy_tell;
	}
	public void setDlvy_tell(int dlvy_tell) {
		this.dlvy_tell = dlvy_tell;
	}
	public int getDlvy_post() {
		return dlvy_post;
	}
	public void setDlvy_post(int dlvy_post) {
		this.dlvy_post = dlvy_post;
	}
	public String getDlvy_addr1() {
		return dlvy_addr1;
	}
	public void setDlvy_addr1(String dlvy_addr1) {
		this.dlvy_addr1 = dlvy_addr1;
	}
	public String getDlvy_addr2() {
		return dlvy_addr2;
	}
	public void setDlvy_addr2(String dlvy_addr2) {
		this.dlvy_addr2 = dlvy_addr2;
	}
	public String getDlvy_remark() {
		return dlvy_remark;
	}
	public void setDlvy_remark(String dlvy_remark) {
		this.dlvy_remark = dlvy_remark;
	}
	@Override
	public String toString() {
		return "deliveryDTO [order_d_no=" + order_d_no + ", invoice_no=" + invoice_no + ", dlvy_date=" + dlvy_date
				+ ", dlvy_name=" + dlvy_name + ", dlvy_tell=" + dlvy_tell + ", dlvy_post=" + dlvy_post + ", dlvy_addr1="
				+ dlvy_addr1 + ", dlvy_addr2=" + dlvy_addr2 + ", dlvy_remark=" + dlvy_remark + "]";
	}
	
	
}
