package admin.shoes.app.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.noticeDAO;
import admin.shoes.app.dto.noticeDTO;

public class InsertEventCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession httpsession = request.getSession();
		String nid = (String) httpsession.getServletContext().getContext("/youshoes").getAttribute("nid");
		
		noticeDAO ndao = new noticeDAO();
		noticeDTO ndto = new noticeDTO();
		
		int noticeInset = ndao.noticeInsert(ndto);
		
		request.setAttribute("nid", nid);
		request.setAttribute("noticeInset", noticeInset);
		
		return "/view/Admin/eventInsert.jsp";
	}

}
