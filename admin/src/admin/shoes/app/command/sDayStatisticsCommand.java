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
import admin.shoes.app.dto.DayStatisticsDTO;
import net.sf.json.JSONArray;

public class sDayStatisticsCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		ordDAO odao = new ordDAO();

		HttpSession httpsession = request.getSession();
		String nid = (String) httpsession.getServletContext().getContext("/youshoes").getAttribute("nid");

		// 현재 년도 월 날 구하기 날짜구하기
		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		int nYear = calendar.get(Calendar.YEAR);
		int nMonth = calendar.get(Calendar.MONTH) + 1;

		int varDaySelect = 0;

		String varRe = request.getParameter("DayChartYearSelect");
		String varDa = request.getParameter("DayChartMonthSelect");
		System.out.println(varRe);
		System.out.println(varDa);
		
		// 연도 파라미터가 없는 경우 현재 연도로 초기화
		if (varRe == null || varRe.equals("")) {
			varDaySelect = nYear;
			varDaySelect = nMonth;
		} else {
			varDaySelect = Integer.parseInt(varRe + varDa);
		}

		List<DayStatisticsDTO> sMemDayStat = odao.sDayStatistics(nid, varDaySelect);

		String jsonArray = JSONArray.fromObject(sMemDayStat).toString();

		return "ajax:" + jsonArray;
	}

}
