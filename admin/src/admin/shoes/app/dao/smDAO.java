package admin.shoes.app.dao;

import java.sql.SQLException;

import admin.shoes.app.dto.smDTO;

/**
 * 
 * @author 유승우
 * 1. 판매회원 등록    smInsert()
 *
 */

public class smDAO extends DAO {  
	// 1. 판매회원 등록    smInsert() - 미완성
	public int smInsert(smDTO dto) {
		int n = 0;
		String sql = "insert into sales_member(sm_id, shop_name, sm_pw, sm_name, sm_tell, business_no, sm_date, sm_post, sm_addr1, sm_addr2, sm_stat_cd, mgr_auth_cd, sm_remark)"
				   + "values(?,?,?,?,?,?,sysdate,?,?,?,?,?,?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getSm_id());
			psmt.setString(2, dto.getShop_name());
			psmt.setString(3, dto.getSm_pw());
			psmt.setString(4, dto.getSm_name());
			psmt.setInt(5, dto.getSm_tell());
			psmt.setInt(6, dto.getBusiness_no());
			psmt.setInt(7, dto.getSm_post());
			psmt.setString(8, dto.getSm_addr1());
			psmt.setString(9, dto.getSm_addr2());
			psmt.setString(10, dto.getSm_stat_cd());
			psmt.setString(11, dto.getMgr_auth_cd());
			psmt.setString(12, dto.getSm_remark());
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}
}
