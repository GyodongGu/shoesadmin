package admin.shoes.app.dto;

import java.sql.Date;

public class replyDTO {
	private int reply_no;
	private int rw_no;
	private Date reply_date;
	private String reply_content;
	private String reply_member;
	
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public int getRw_no() {
		return rw_no;
	}
	public void setRw_no(int rw_no) {
		this.rw_no = rw_no;
	}
	public Date getReply_date() {
		return reply_date;
	}
	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_member() {
		return reply_member;
	}
	public void setReply_member(String reply_member) {
		this.reply_member = reply_member;
	}
	@Override
	public String toString() {
		return "replyDTO [reply_no=" + reply_no + ", rw_no=" + rw_no + ", reply_date=" + reply_date + ", reply_content="
				+ reply_content + ", reply_member=" + reply_member + "]";
	}
	
	
}
