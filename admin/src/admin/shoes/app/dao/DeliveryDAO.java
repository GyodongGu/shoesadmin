package admin.shoes.app.dao;

import java.util.ArrayList;
import java.util.List;

import admin.shoes.app.dto.deliveryDTO;

public class DeliveryDAO extends DAO{

	public List<deliveryDTO> select(String id) {
		List<deliveryDTO> list = new ArrayList<deliveryDTO>();
			
		try {
		String sql = "select c.invoice_no, c.dlvy_date, c.dlvy_name, c.dlvy_tell, c.dlvy_post, c.dlvy_addr1, c.dlvy_addr2, c.dlvy_addr3, c.dlvy_remark, c.ord_no\r\n" + 
				"from product a, ord b, delivery c where a.pdt_no = b.pdt_no and b.ord_no = c.ord_no and sm_id = ?";
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, id);
		rs = psmt.executeQuery();
		while(rs.next()) {
			deliveryDTO dto = new deliveryDTO();
			dto.setOrd_no(rs.getInt("ord_no"));
			dto.setInvoice_no(rs.getString("invoice_no"));
			dto.setDlvy_date(rs.getDate("dlvy_date"));
			dto.setDlvy_name(rs.getString("dlvy_name"));
			dto.setDlvy_tell(rs.getString("dlvy_tell"));
			dto.setDlvy_post(rs.getString("dlvy_post"));
			dto.setDlvy_addr1(rs.getString("dlvy_addr1"));
			dto.setDlvy_addr2(rs.getString("dlvy_addr2"));
			dto.setDlvy_addr3(rs.getString("dlvy_addr3"));
			dto.setDlvy_remark(rs.getString("dlvy_remark"));
			list.add(dto);
		}
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return list;
	}
	
	public int insert(int ord, String no) {
		int result = 0;
		try {
			String sql = "update delivery set invoice_no = ? where ord_no = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			psmt.setInt(2, ord);
			result = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
