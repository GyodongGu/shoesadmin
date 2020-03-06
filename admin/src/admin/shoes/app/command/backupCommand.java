package admin.shoes.app.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.backupDAO;
import admin.shoes.app.dto.backupDTO;

public class backupCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		backupDAO bdao = new backupDAO();
		List<backupDTO> backupList = bdao.backupSelect();
		request.setAttribute("backupList", backupList);

		return "/view/Admin/backup.jsp";
	}

}
