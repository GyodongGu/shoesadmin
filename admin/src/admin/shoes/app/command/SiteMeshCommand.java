package admin.shoes.app.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.shoes.app.common.Command;

public class SiteMeshCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		HttpSession httpsession = request.getSession();
		
		String grant = (String)httpsession.getServletContext().getContext("/youshoes").getAttribute("ngrant");
		
		request.setAttribute("grant", grant);
		
		return "/view/siteMesh.jsp";
	}

}
