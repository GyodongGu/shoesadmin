package admin.shoes.app.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.ordDAO;
import admin.shoes.app.dto.DayStatisticsDTO;
import admin.shoes.app.dto.MonthStatisticsDTO;
import admin.shoes.app.dto.StatisticsDTO;
import net.sf.json.JSONArray;

public class sDayStatisticsCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		ordDAO odao = new ordDAO();

		HttpSession httpsession = request.getSession();
		String nid = (String) httpsession.getServletContext().getContext("/youshoes").getAttribute("nid");

		Integer varDaySelect = null;

		// 연도 파라미터가 없는 경우 현재 연도로 초기화
		if (varDaySelect == null) {
			varDaySelect = 202002;
		} else {
			varDaySelect = Integer.parseInt(request.getParameter("yearSelect"));
		}

		List<DayStatisticsDTO> sMemDayStat = odao.sDayStatistics(nid, varDaySelect);

		String jsonArray = JSONArray.fromObject(sMemDayStat).toString();

		return "ajax:" + jsonArray;
	}

}
