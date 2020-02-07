package admin.shoes.app.ajax;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import admin.shoes.app.board.DAO;

public class chartDAO extends DAO{
	
		public List<Map<String, Object>> getDetpCnt(){
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			try {
				String sql = "select count(e.employee_id) cnt, d.department_name \r\n" + 
						"from employees e, departments d \r\n" + 
						"where e.department_id = d.department_id \r\n" + 
						"group by d.department_name";
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
