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
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		noticeDAO ndao = new noticeDAO();
		noticeDTO ndto = new noticeDTO();

		String varTitle = request.getParameter("title");
		String varContent = request.getParameter("Content");

		ndto.setNotice_title(varTitle);
		ndto.setNotice_content(varContent);

		ndao.noticeInsert(ndto);
		request.setAttribute("msg", "noticeInsert");
		
		return "redirect:/admin/eventManage.do";
	}

}
