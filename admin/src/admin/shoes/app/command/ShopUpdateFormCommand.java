package admin.shoes.app.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.shoes.app.common.Command;

import admin.shoes.app.dao.smDAO;

import admin.shoes.app.dto.smDTO;

public class ShopUpdateFormCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		HttpSession httpsession = request.getSession();

		String nid = (String) httpsession.getServletContext().getContext("/youshoes").getAttribute("nid");
				
		request.setAttribute("nid", nid);
		
		
		
		smDAO smdao = new smDAO();
		smDTO smdto = new smDTO();
		smdto = smdao.smSelectOne(nid);
		
		request.setAttribute("smdto", smdto);
		
		return "/view/sMem/shopUpdateForm.jsp";
	}

}
