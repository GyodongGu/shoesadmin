package admin.shoes.app.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import admin.shoes.app.dto.noticeDTO;

/**
 * 
 * @author 유승우 
 * 1. 공지사항 조회 noticeSelect()
 * 2. 공지사항 등록 noticeInsert()
 * 3. 공지사항 수정 noticeUpdate()
 * 4. 공지사항 삭제 noticeDelete()
 * 5. 공지사항 단건조회 noticeOneSelect()
 */

public class noticeDAO extends DAO {
	// 1. 공지사항 조회 noticeSelect()
	public List<noticeDTO> noticeSelect() {
		List<noticeDTO> list = new ArrayList<noticeDTO>();
		String sql = "select * from notice order by notice_no desc";
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				noticeDTO ndto = new noticeDTO();
				ndto.setNotice_no(rs.getInt("notice_no"));
				ndto.setNotice_title(rs.getString("notice_title"));
				ndto.setNotice_date(rs.getDate("notice_date"));
				ndto.setNotice_content(rs.getString("notice_content"));
				list.add(ndto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	// 2. 공지사항 등록 noticeInsert()
	public int noticeInsert(noticeDTO dto) {
		int n = 0;
		String sql = "insert into notice(notice_no, notice_title, notice_date, notice_content)"
				   + " values((select max(notice_no)+1 from notice), ?, sysdate, ?)";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getNotice_title());
			psmt.setString(2, dto.getNotice_content());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}
	
	// 3. 공지사항 수정 noticeUpdate()
	public int noticeUpdate(noticeDTO dto) {
		int n = 0;
		String sql = "update notice set notice_title = ?, notice_content =? where notice_no = ?";
		System.out.println(sql);
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getNotice_title());
			psmt.setString(2, dto.getNotice_content());
			psmt.setInt(3, dto.getNotice_no());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}
	
	// 4. 공지사항 삭제 noticeDelete()
	public int noticeDelete(noticeDTO dto) {
		int n = 0;
		String sql = "delete from notice where notice_no = ?";
		System.out.println(sql);
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getNotice_no());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}
	// 5. 공지사항 단건조회 noticeOneSelect()
	public noticeDTO noticeOneSelect(int noticeNo) {
		noticeDTO ndto = new noticeDTO();
		
		String sql = "select * from notice where notice_no = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, noticeNo);
			System.out.println(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ndto.setNotice_no(rs.getInt("notice_no"));
				ndto.setNotice_title(rs.getString("notice_title"));
				ndto.setNotice_date(rs.getDate("notice_date"));
				ndto.setNotice_content(rs.getString("notice_content"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return ndto;
	}
}
