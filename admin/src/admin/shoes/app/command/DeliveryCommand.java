package admin.shoes.app.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.DeliveryDAO;
import admin.shoes.app.dto.deliveryDTO;

public class DeliveryCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		HttpSession httpsession = request.getSession();
		String nid = (String) httpsession.getServletContext().getContext("/youshoes").getAttribute("nid");
		DeliveryDAO dao = new DeliveryDAO();
		List<deliveryDTO> list = dao.select(nid);
		request.setAttribute("list", list); 
		
		return "/view/sMem/delivery.jsp";
	}

}
