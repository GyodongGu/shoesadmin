package admin.shoes.app.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.pmDAO;
import admin.shoes.app.dto.pmDTO;

public class allGuestCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws IOException, ServletException {
		
		pmDAO pdao = new pmDAO();
		List<pmDTO> list = pdao.pmSelect();
		
		request.setAttribute("list", list);
		
		return "/view/Admin/allGuest.jsp";
	}

}
