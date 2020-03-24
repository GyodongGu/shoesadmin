package admin.shoes.app.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.smDAO;
import admin.shoes.app.dto.smDTO;

public class UpdateSmemFormCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws IOException, ServletException {

		smDAO sdao = new smDAO();
		smDTO sdto = new smDTO();

		String smid= (String) request.getParameter("sm_id");
		
		sdto = sdao.smSelectOne(smid);
		request.setAttribute("sdto", sdto);

		return "/view/Admin/UpdateSmem.jsp";
	}

}
