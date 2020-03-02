package admin.shoes.app.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import admin.shoes.app.dto.backupDTO;

/**
 * @author 유승우
 * 1. backup테이블 조회 backupSelect()
 *
 */

public class backupDAO extends DAO {
	// 1. backup테이블 조회 backupSelect()
	public List<backupDTO> backupSelect() {
		List<backupDTO> list = new ArrayList<backupDTO>();
		String sql = "select * from backup";
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				backupDTO bdto = new backupDTO();
				bdto.setOrder_no(rs.getInt("ord_no"));
				bdto.setOrder_date(rs.getDate("ord_date"));
				bdto.setOrder_cnt(rs.getInt("ord_cnt"));
				bdto.setOrder_point(rs.getInt("ord_point"));
				bdto.setOrder_stat_cd(rs.getString("ord_stat_cd"));
				bdto.setGroup_dlvy_cd(rs.getString("group_dlvy_cd"));
				bdto.setEp_order_point(rs.getInt("ep_ord_point"));
				bdto.setRefund_point(rs.getInt("refund_point"));
				bdto.setRefund_date(rs.getDate("refund_date"));
				list.add(bdto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

}
