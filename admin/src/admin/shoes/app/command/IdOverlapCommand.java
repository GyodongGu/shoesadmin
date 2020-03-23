package admin.shoes.app.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.smDAO;

public class IdOverlapCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws IOException, ServletException {
		smDAO dao = new smDAO();
		
		String id = request.getParameter("sm_id");
		boolean b = dao.IdOverlap(id);
		
		request.setAttribute("idCheck", b);
		request.setAttribute("sm_id", id);
		
		return "/view/Admin/IdOverlap.jsp";
	}

}
