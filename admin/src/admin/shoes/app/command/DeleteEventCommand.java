package admin.shoes.app.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.noticeDAO;
import admin.shoes.app.dto.noticeDTO;

public class DeleteEventCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		noticeDAO ndao = new noticeDAO();
		noticeDTO ndto = new noticeDTO();
		
		int varNoticeNo = Integer.parseInt(request.getParameter("notice_no"));
		ndto.setNotice_no(varNoticeNo);
		
		ndao.noticeDelete(ndto);
		request.setAttribute("msg", "noticeDelete");
		
		return "redirect:/admin/eventManage.do";
	}

}
