package admin.shoes.app.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.smDAO;
import admin.shoes.app.dto.smDTO;

public class InsertSmemCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		HttpSession httpsession = request.getSession();
		String nid = (String) httpsession.getServletContext().getContext("/youshoes").getAttribute("nid");

		smDAO sdao = new smDAO();
		smDTO sdto = new smDTO();

		int smInsert = sdao.smInsert(sdto);

		request.setAttribute("smInsert", smInsert);
		request.setAttribute("nid", nid);

		return "/view/Admin/InsertSmem.jsp";
	}

}
