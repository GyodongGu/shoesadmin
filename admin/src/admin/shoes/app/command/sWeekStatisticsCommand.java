package admin.shoes.app.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.ordDAO;
import net.sf.json.JSONArray;

public class sWeekStatisticsCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		ordDAO odao = new ordDAO();

		HttpSession httpsession = request.getSession();
		String nid = (String) httpsession.getServletContext().getContext("/youshoes").getAttribute("nid");

//		String varWeekSelect = request.getParameter("yearSelect");

//		List<StatisticsDTO> sMemWeekStat = odao.sMonthStatistics(nid, varWeekSelect);

//		String jsonArray = JSONArray.fromObject(sMemWeekStat).toString();
//
		return "ajax:";
	}

}
