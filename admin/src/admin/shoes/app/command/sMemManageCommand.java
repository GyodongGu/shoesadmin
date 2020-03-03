package admin.shoes.app.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.smDAO;
import admin.shoes.app.dto.smDTO;

public class sMemManageCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		smDAO sdao = new smDAO();
		List<smDTO> sMemSelect = sdao.smSelect();
		request.setAttribute("sMemSelect", sMemSelect);

		return "/view/Admin/sMemManage.jsp";
	}

}
