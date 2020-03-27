package admin.shoes.app.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import admin.shoes.app.dto.deliveryDTO;

public class DeliveryDAO extends DAO{

	public List<deliveryDTO> select(String id) {
		List<deliveryDTO> list = new ArrayList<deliveryDTO>();
			
		try {
		String sql = "select c.invoice_no, a.pdt_type_cd, b.ord_stat_cd, c.dlvy_date, c.dlvy_name, c.dlvy_tell, c.dlvy_post, c.dlvy_addr1, c.dlvy_addr2, c.dlvy_addr3, c.dlvy_remark, c.ord_no\r\n" + 
				"from product a, ord b, delivery c where a.pdt_no = b.pdt_no and b.ord_no = c.ord_no and sm_id = ?";
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, id);
		rs = psmt.executeQuery();
		while(rs.next()) {
			deliveryDTO dto = new deliveryDTO();
			dto.setOrd_no(rs.getInt("ord_no"));
			dto.setInvoice_no(rs.getString("invoice_no"));
			CodeDAO dao = new  CodeDAO();
			String typecd = dao.CodeidToCodename(rs.getString("pdt_type_cd"));
			dto.setPdt_type_cd(typecd);
			CodeDAO cdao = new  CodeDAO();
			String statcd = cdao.CodeidToCodename(rs.getString("ord_stat_cd"));
			dto.setOrd_stat_cd(statcd);
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
	
	public int insert(String no, int ord) {
		int result = 0;
		int result1 = 0;
		PreparedStatement psmt1;
		ResultSet rs1;
		try {	
			String sql1 = "update delivery set invoice_no = ? where ord_no = ?";
			psmt = conn.prepareStatement(sql1);
			psmt.setString(1, no);
			psmt.setInt(2, ord);
			result = psmt.executeUpdate();
			String sql2 = "update ord set ord_stat_cd = 'O03' where ord_no = ?";
			psmt1 = conn.prepareStatement(sql2);
			psmt1.setInt(1, ord);
			result1 = psmt1.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	public int insertOrd(int ord) {
		int result = 0;
		try {
			String sql = "update ord set ord_stat_cd = 'O02' where ord_no = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, ord);
			result = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
}
