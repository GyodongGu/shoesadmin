package admin.shoes.app.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import admin.shoes.app.dto.refundDTO;

public class RefundDAO extends DAO{
	
	public List<refundDTO> RefundList(String smid){
		List<refundDTO> list = new ArrayList<refundDTO>();
		
		String sql = "select r.*, pm_name from refund r join ord o on r.ord_no = o.ord_no join purchase_member p on o.pm_no = p.pm_no join product d on o.pdt_no=d.pdt_no where sm_id=?";
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, smid);
			rs=psmt.executeQuery();
			while(rs.next()) {
				refundDTO rdto = new refundDTO();
				rdto.setOrd_no(rs.getInt("ord_no"));
				rdto.setRefund_date(rs.getDate("refund_date"));
				rdto.setRefund_point(rs.getInt("refund_point"));
				rdto.setRefund_reason(rs.getString("refund_reason"));
				rdto.setPm_name(rs.getString("pm_name"));
				list.add(rdto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

}
