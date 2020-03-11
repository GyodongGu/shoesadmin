package admin.shoes.app.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.ordDAO;
import admin.shoes.app.dto.ordDTO;

public class GuestOrdList implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		ordDAO odao = new ordDAO();
		
		String pmno = request.getParameter("pm_no");
		List<ordDTO> list = new ArrayList<ordDTO>();
		list = odao.ordList(Integer.parseInt(pmno));
		
		request.setAttribute("ordlist", list);
		
		return "/view/sMem/ordlistOfsmem.jsp";
	}

}
