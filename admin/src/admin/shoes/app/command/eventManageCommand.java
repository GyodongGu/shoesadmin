package admin.shoes.app.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.noticeDAO;
import admin.shoes.app.dto.noticeDTO;

public class eventManageCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		HttpSession httpsession = request.getSession();
		String nid = (String) httpsession.getServletContext().getContext("/youshoes").getAttribute("nid");

		noticeDAO ndao = new noticeDAO();
		List<noticeDTO> sMemNotice = ndao.noticeSelect();

		request.setAttribute("sMemNotice", sMemNotice);
		request.setAttribute("nid", nid);

		return "/view/Admin/eventManage.jsp";
	}

}
