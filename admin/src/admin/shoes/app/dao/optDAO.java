package admin.shoes.app.dao;

import java.sql.SQLException;

import admin.shoes.app.dto.optDTO;

public class optDAO extends DAO{
	
	public int insertOpt(optDTO odto) {
		int result = 0;
		
		String sql = "insert into opt values( (select max(pdt_no)from product),?,? )";
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, odto.getPdt_size_cd());
			psmt.setString(2, odto.getPdt_color_cd());
			result = psmt.executeUpdate();
			System.out.println("opt테이블에 "+result+"건 입력되었습니다.");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	}

}
