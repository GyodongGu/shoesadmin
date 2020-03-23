package admin.shoes.app.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.noticeDAO;
import admin.shoes.app.dto.noticeDTO;

public class UpdateEventSelectCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		noticeDAO ndao = new noticeDAO();
		List<noticeDTO> sMemNotice = ndao.noticeSelect();

		request.setAttribute("sMemInfo", sMemNotice);
		
		return "/view/Admin/UpdateEvent.jsp";
	}

}
