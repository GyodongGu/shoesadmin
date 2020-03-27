package admin.shoes.app.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import admin.shoes.app.dto.codeDTO;

/**
 * @author 유승우
 * 1. 코드목록 조회 codeSelect()
 *
 */

public class CodeDAO extends DAO {
	
	public List<codeDTO> codeSelect() {
		List<codeDTO> list = new ArrayList<codeDTO>();
		String sql = "select * from code";
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				codeDTO cdto = new codeDTO();
				cdto.setCode_id(rs.getString("code_id"));
				cdto.setCode_type(rs.getString("code_type"));
				cdto.setCode_name(rs.getString("code_name"));
				cdto.setCode_use(rs.getString("code_use"));
				cdto.setCode_explain(rs.getString("code_explain"));
				list.add(cdto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public List<codeDTO> SelectOneType(String type){
		List<codeDTO> list = new ArrayList<codeDTO>();
		
		String sql = "select * from code where code_type=?";
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, type);
			rs = psmt.executeQuery();
			while(rs.next()) {
				codeDTO cdto = new codeDTO();
				cdto.setCode_id(rs.getString("code_id"));
				cdto.setCode_type(rs.getString("code_type"));
				cdto.setCode_name(rs.getString("code_name"));
				cdto.setCode_use(rs.getString("code_use"));
				cdto.setCode_explain(rs.getString("code_explain"));
				list.add(cdto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public String CodeidToCodename(String codeid) {
		String result=null;
		
		String sql = "select code_name from code where code_id=?";
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, codeid);
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				result=rs.getString("code_name");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		
		return result;
	}
	
}
