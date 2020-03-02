package admin.shoes.app.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import admin.shoes.app.dto.smDTO;

/**
 * 
 * @author 유승우
 * 1. 판매회원 전체조회    smSelect()
 * 2. 판매회원 등록    smInsert()
 * 3. 판매회원 수정    smUpdate()
 * 4. 판매회원 삭제    smDelete()
 *
 */

public class smDAO extends DAO { 
	private smDTO dto;
	private ArrayList<smDTO> list;
	
	public smDAO() {
		super();
	}
	
	// 1. 판매회원 전체 조회    smSelect()
	public ArrayList<smDTO> smSelect() {
		list = new ArrayList<smDTO>();
		String sql = "select * from sales_member";
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				dto = new smDTO();
				dto.setSm_id(rs.getString("sm_id"));
				dto.setShop_name(rs.getString("shop_name"));
				dto.setSm_name(rs.getString("sm_name"));
				dto.setSm_tell(rs.getInt("sm_tell"));
				dto.setBusiness_no(rs.getInt("business_no"));
				dto.setSm_post(rs.getInt("sm_post"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}
	
	// 2. 판매회원 등록    smInsert() - 미완성
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
	
	// 3. 판매회원 수정    smUpdate()
	
	//4. 판매회원 삭제    smDelete()
	public void smDelete(String id) {
		try {
			String sql = "delete from sales_member where sm_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
}
