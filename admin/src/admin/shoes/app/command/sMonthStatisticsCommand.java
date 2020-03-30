package admin.shoes.app.command;

import java.io.IOException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.ordDAO;
import admin.shoes.app.dto.MonthStatisticsDTO;
import net.sf.json.JSONArray;

@WebServlet("/yearStat")
public class sMonthStatisticsCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		ordDAO odao = new ordDAO();

		HttpSession httpsession = request.getSession();
		String nid = (String) httpsession.getServletContext().getContext("/youshoes").getAttribute("nid");

		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		int nYear = calendar.get(Calendar.YEAR);

		int varYearSelect = 0;
		// 연도 파라미터가 없는 경우 현재 연도로 초기화

		String varRe = request.getParameter("yearSelect");
		System.out.println(varRe);
		if (varRe == null || varRe.equals("")) {
			varYearSelect = nYear;
		} else {
			varYearSelect = Integer.parseInt(varRe);
		}

		List<MonthStatisticsDTO> sMemMonthStat = odao.sMonthStatistics(varYearSelect, nid);

		String jsonArray = JSONArray.fromObject(sMemMonthStat).toString();

		return "ajax:" + jsonArray;
	}

}
