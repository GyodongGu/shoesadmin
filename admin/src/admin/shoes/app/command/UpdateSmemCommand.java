
package admin.shoes.app.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.smDAO;
import admin.shoes.app.dto.smDTO;

public class UpdateSmemCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		HttpSession httpsession = request.getSession();
		String nid = (String) httpsession.getServletContext().getContext("/youshoes").getAttribute("nid");
		
		request.setAttribute("nid", nid);
		
		smDTO sdto = new smDTO();
		smDAO sdao = new smDAO();
		
		
//		sdto.set
		
		List<smDTO> list = new ArrayList<smDTO>();
//		list = sdao.smUpdate(nid);
		
		request.setAttribute("smUpdate", list);
		
		return "/view/Admin/UpdateSmem.jsp";
	}

}
