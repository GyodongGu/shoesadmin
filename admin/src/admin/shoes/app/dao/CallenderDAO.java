package admin.shoes.app.dao;



import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import admin.shoes.app.dao.DAO;
import admin.shoes.app.dto.dailyWorkDTO;

public class CallenderDAO extends DAO{

	public int insertform(Date date) {
		int result = 0;
		try {
			String sql = "insert into daily_work (sm_id, rest_date) values ('manshoes01', ?)";
			psmt = conn.prepareStatement(sql);
			//psmt.setString(1, dto.getSm_id());
			psmt.setDate(1,  date);
			result = psmt.executeUpdate();
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
	
	public List<Map<String, Object>> selectform() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try {
			String sql = "select '' as title, rest_date as start from daily_work";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("title", "");
				map.put("start", rs.getDate("rest_date"));
				list.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	public int deleteform(Date date) {
		int result = 0;
		try {
			String sql = "delete daily_work where rest_date = ?";
			psmt = conn.prepareStatement(sql);
			//psmt.setString(1, dto.getSm_id());
			psmt.setDate(1,  date);
			result = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
}
