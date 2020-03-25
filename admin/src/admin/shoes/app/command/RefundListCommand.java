package admin.shoes.app.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.RefundDAO;
import admin.shoes.app.dto.refundDTO;

public class RefundListCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		HttpSession httpsession = request.getSession();
		String nid = (String) httpsession.getServletContext().getContext("/youshoes").getAttribute("nid");
		
		RefundDAO rdao = new RefundDAO();
		List<refundDTO> list = rdao.RefundList(nid);
		
		request.setAttribute("list", list);
		
		return "/view/sMem/refund.jsp";
	}

}
