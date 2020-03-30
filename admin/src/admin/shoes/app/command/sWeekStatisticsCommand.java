package admin.shoes.app.command;

import java.io.IOException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.ordDAO;
import admin.shoes.app.dto.WeekStatisticsDTO;
import net.sf.json.JSONArray;

public class sWeekStatisticsCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		ordDAO odao = new ordDAO();

		HttpSession httpsession = request.getSession();
		String nid = (String) httpsession.getServletContext().getContext("/youshoes").getAttribute("nid");

		
		// 현재 년도 월 날 구하기 날짜구하기
		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		int nYear = calendar.get(Calendar.YEAR);
		int nMonth = calendar.get(Calendar.MONTH) + 1;

		
		int varWeekSelect = 0;
		
		String varRe = request.getParameter("WeekChartyearSelect");
		String varDa = request.getParameter("WeekChartMonthSelect");
		System.out.println(varRe);
		System.out.println(varDa);
		
		if (varRe == null || varRe.equals("")) {
			varWeekSelect = nYear;
			varWeekSelect = nMonth;
		} else {
			varWeekSelect = Integer.parseInt(varRe + varDa);
		}
		
		List<WeekStatisticsDTO> sMemWeekStat = odao.sWeekStatistics(nid, varWeekSelect);

		String jsonArray = JSONArray.fromObject(sMemWeekStat).toString();

		return "ajax:" + jsonArray;
	}

}
