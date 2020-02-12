package admin.shoes.app.command;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.chartDAO;
import net.sf.json.JSONArray;

public class getDeptCnt implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
			//ChartDAO
			chartDAO dao = new chartDAO();
			List<Map<String, Object>> list = dao.getDetpCnt();
			// Json String 변환
			String result = JSONArray.fromObject(list).toString();
			
		return "ajax:" + result;
	}

}
