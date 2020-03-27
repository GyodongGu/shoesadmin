package admin.shoes.app.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.CallenderDAO;
import admin.shoes.app.dto.dailyWorkDTO;

public class SetHolidayImportCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		HttpSession httpsession = request.getSession();
		String nid = (String) httpsession.getServletContext().getContext("/youshoes").getAttribute("nid");
		CallenderDAO dao = new CallenderDAO();
		int week = Integer.parseInt(request.getParameter("week"));
		int day = Integer.parseInt(request.getParameter("day"));
		dao.insertholdiay(week, day, nid);
		return null;
	}

}
