package admin.shoes.app.command;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.CallenderDAO;
import net.sf.json.JSONArray;

public class getHoliday implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
			CallenderDAO dao = new CallenderDAO();
			List<Map<String, Object>> list = dao.selectform();
			
			String result = JSONArray.fromObject(list).toString();
		return "ajax:" + result;
	}

}
