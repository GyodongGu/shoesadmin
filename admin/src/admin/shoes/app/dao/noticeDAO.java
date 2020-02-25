package admin.shoes.app.dao;

import java.sql.SQLException;

import admin.shoes.app.dto.noticeDTO;

/**
 * 
 * @author 유승우 1. 공지사항 등록 noticeInsert()
 */

public class noticeDAO extends DAO {
	// 1. 공지사항 등록 noticeInsert()
	public int noticeInsert(noticeDTO dto) {
		int n = 0;
		String sql = "insert into notice(notice_no, notice_title, notice_date, notice_content)"
				   + " value((select max(notice_no)+1 from notice), ?, sysdate, ?)";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getNotice_title());
			psmt.setString(2, dto.getNotice_content());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return n;
	}
}
