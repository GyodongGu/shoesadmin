package admin.shoes.app.dao;



import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import admin.shoes.app.dao.DAO;
import admin.shoes.app.dto.dailyWorkDTO;

public class CallenderDAO extends DAO{

	public int insertform(String id, Date date) {
		int result = 0;
		try {
			String sql = "insert into daily_work (sm_id, rest_date) values (?, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setDate(2,  date);
			result = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
	
	public List<Map<String, Object>> selectform(String id) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try {
			String sql = "select sm_id, to_char(rest_date, 'yyyy-mm-dd') as rest_date from daily_work where sm_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("title", "휴일");
				map.put("start", rs.getString("rest_date"));
				list.add(map);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		} 
		return list;
	}
	
	public int deleteform(dailyWorkDTO dto) {
		int result = 0;
		try {
			String sql = "delete daily_work where rest_date = ? and sm_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setDate(1,  dto.getRest_date());
			psmt.setString(2, dto.getSm_id());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
	
	//예약 일정 뷰
		public List<Map<String, Object>> selectReserv(String id) {
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			try {
				String sql = "select to_char(res_date, 'yyyy-mm-dd')||'T'||to_char(res_date, 'hh24:mi:ss') res_date, res_no from reservation where sm_id = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				rs = psmt.executeQuery();
				while(rs.next()) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("title", "예약");
					map.put("start", rs.getString("res_date"));
					map.put("id", rs.getInt("res_no"));
					list.add(map);
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return list;
		}
}
