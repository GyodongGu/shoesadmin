package admin.shoes.app.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.ordDAO;
import admin.shoes.app.dto.StatisticsDTO;
import net.sf.json.JSONArray;

public class AjaxAdminStatisticsCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		ordDAO odao = new ordDAO();

		List<StatisticsDTO> yearStat = odao.YouShoesStatistics();
		
		String jsonArray = JSONArray.fromObject(yearStat).toString(); 
		
		return "ajax:" + jsonArray;
	}

}
