package admin.shoes.app.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.DeliveryDAO;
import admin.shoes.app.dto.deliveryDTO;

public class SetDeliveryCommand implements Command  {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
			int ordno = Integer.parseInt(request.getParameter("ordno"));
			String invoiceno = request.getParameter("invoiceno");
			DeliveryDAO dao = new DeliveryDAO();
			
			dao.insert(invoiceno, ordno);
			
		return null;
	}

}
