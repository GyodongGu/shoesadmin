package admin.shoes.app.command;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.CallenderDAO;

public class SetHoliday implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession httpsession = request.getSession();
		String nid = (String) httpsession.getServletContext().getContext("/youshoes").getAttribute("nid");
		CallenderDAO dao = new CallenderDAO();
		String holiday1 = request.getParameter("rest_date");
		Date holiday2 = null;
		try {
			holiday2 = new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(holiday1).getTime());
		} catch (ParseException e) {

			e.printStackTrace();
		}
		int r;
		r = dao.insertform(nid, holiday2);
		return "ajax:" + holiday1;
	}

}
