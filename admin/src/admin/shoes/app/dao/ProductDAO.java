package admin.shoes.app.dao;

import java.sql.SQLException;

import admin.shoes.app.dto.pdtDTO;

public class ProductDAO extends DAO{
	
	public int insertProduct(pdtDTO pdto) {
		int result=0;
		
		String sql ="insert into product values((select max(pdt_no)+1 from product), ?,?,?,?,?,?,'I',sysdate )";
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, pdto.getPdt_name());
			psmt.setString(2, pdto.getSm_id());
			psmt.setString(3, pdto.getPdt_type_cd());
			psmt.setString(4, pdto.getPdt_kind_cd());
			psmt.setString(5, pdto.getGender_cd());
			psmt.setInt(6, pdto.getPdt_price());
			
			result = psmt.executeUpdate();
			System.out.println("제품 " + result +" 건 등록되었습니다.");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	}

}
