
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
		
		sdto.setShop_name(request.getParameter("shop_name"));
		sdto.setSm_pw(request.getParameter("sm_pw"));
		sdto.setSm_tell(request.getParameter("sm_tell"));
		sdto.setSm_post(request.getParameter("sm_post"));
		sdto.setSm_addr1(request.getParameter("sm_addr1"));
		sdto.setSm_addr2(request.getParameter("sm_addr2"));
		sdto.setSm_addr3(request.getParameter("sm_addr3"));
		int smUpdate = sdao.smUpdate(sdto, "sm_id");
		
		request.setAttribute("smUpdate", smUpdate);
		
		return "view/Admin/UpdateSmem.jsp";
	}

}
