package admin.shoes.app.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.noticeDAO;
import admin.shoes.app.dto.noticeDTO;

public class UpdateEventCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		noticeDAO ndao = new noticeDAO();
		noticeDTO ndto = new noticeDTO();

		int varNoticeNo = Integer.parseInt(request.getParameter("UpdateNoticeNo"));
		String varNoticeTitle = request.getParameter("UpdateNoticeTitle");
		String varNoticeContent = request.getParameter("UpdateNoticeContent");

		ndto.setNotice_no(varNoticeNo);
		ndto.setNotice_title(varNoticeTitle);
		ndto.setNotice_content(varNoticeContent);

		ndao.noticeUpdate(ndto);
		request.setAttribute("msg", "noticeUpdate");

		return "redirect:/admin/eventManage.do";
	}
}
