package admin.shoes.app.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.pmDAO;
import admin.shoes.app.dto.pmDTO;

public class MyGuestListCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		// 세션처리
		HttpSession httpsession = request.getSession();
		String nid = (String) httpsession.getServletContext().getContext("/youshoes").getAttribute("nid");
		request.setAttribute("nid", nid);

		pmDAO pdao = new pmDAO();
		ArrayList<pmDTO> list = new ArrayList<pmDTO>();
		list = pdao.pmListOfSm(nid);

		request.setAttribute("list", list);

		return "/view/sMem/guestList.jsp";
	}

}
