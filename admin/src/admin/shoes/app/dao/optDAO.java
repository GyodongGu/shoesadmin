package admin.shoes.app.dao;

import java.sql.SQLException;

import admin.shoes.app.dto.optDTO;

public class optDAO extends DAO{
	
	public int insertOpt(optDTO odto) {
		int result = 0;
		int cnt=0;
		String sql="";
		if(odto.getPdt_no()==0) {
			sql = "insert into opt values( (select max(pdt_no)from product),?,? )";
			
		}else {
			sql = "insert into opt values( ?,?,? )";
			
		}
		
		try {
			psmt=conn.prepareStatement(sql);
			if(odto.getPdt_no()!=0) {
				psmt.setInt(++cnt, odto.getPdt_no());
			}
			psmt.setInt(++cnt, odto.getPdt_size_cd());
			psmt.setString(++cnt, odto.getPdt_color_cd());
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
	
	public int deleteOpt(int pdtno, int pdtsize) {
		int result=0;
		String sql="delete from opt where pdt_no=? and pdt_size_cd=?";
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, pdtno);
			psmt.setInt(2, pdtsize);
			result=psmt.executeUpdate();
			System.out.println("opt "+result+"건 삭제되었습니다.");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	}
	public int countOpt(int pdtno) {
		int count=0;
		
		String sql="select count(pdt_no) pdt_no from opt where pdt_no=?";
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, pdtno);
			rs=psmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt("pdt_no");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return count;
	}

}
