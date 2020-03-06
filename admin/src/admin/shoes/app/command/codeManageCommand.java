package admin.shoes.app.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.CodeDAO;
import admin.shoes.app.dto.codeDTO;

public class codeManageCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		CodeDAO cdao = new CodeDAO();
		List<codeDTO> codeList = cdao.codeSelect();
		request.setAttribute("codeList", codeList);

		return "/view/Admin/codeManage.jsp";
	}

}
