package admin.shoes.app.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.DeliveryDAO;

public class SetOrdTypeCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		int ordno = Integer.parseInt(request.getParameter("ordno"));
		DeliveryDAO dao = new DeliveryDAO();
		
		dao.insertOrd(ordno);
		return null;
	}

}
