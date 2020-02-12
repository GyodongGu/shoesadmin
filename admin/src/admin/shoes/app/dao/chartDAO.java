package admin.shoes.app.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import admin.shoes.app.dao.DAO;

public class chartDAO extends DAO{
	
		public List<Map<String, Object>> getDetpCnt(){
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			try {
				String sql = "select sum(pay_point) from pay_history";
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				while (rs.next()) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("cnt", rs.getInt(1));
					map.put("department_name", rs.getString(1));
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
