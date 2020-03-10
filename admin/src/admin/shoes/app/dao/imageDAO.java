package admin.shoes.app.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import admin.shoes.app.dto.imageDetailDTO;

public class imageDAO extends DAO{
	
	public int insertProductImage(imageDetailDTO iddto) {
		int result=0;
		int result1=0;
		String sql = "insert into image values((select max(img_no)+1 from image),'I02',(select max(pdt_no) from product))";
		String sql1= "insert into image_detail values((select max(img_no)+1 from image_detail),?,sysdate,?,'Y')";
		
		PreparedStatement psmt1;
		
		try {
			psmt=conn.prepareStatement(sql);
			result = psmt.executeUpdate();
			System.out.println("image 테이블에 "+result+"건 입력되었습니다.");
			
			psmt1=conn.prepareStatement(sql1);
			psmt1.setString(1, iddto.getImg_name());
			psmt1.setInt(2, iddto.getImg_size());
			result1 = psmt1.executeUpdate();
			System.out.println("image_detail 테이블에 "+result1+"건 입력되었습니다.");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result1+result;
	}
	
	public int deleteShopImage(int imgno) {
		int result=0;
		
		String sql ="delete from image where img_no=?";
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, imgno);
			
			result=psmt.executeUpdate();
			System.out.println("이미지 "+result+"건 삭제되었습니다.");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

}
