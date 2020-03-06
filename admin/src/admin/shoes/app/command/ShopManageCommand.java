package admin.shoes.app.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.ProductDAO;
import admin.shoes.app.dto.pdtDTO;

public class ShopManageCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession httpsession = request.getSession();

		String nid = (String) httpsession.getServletContext().getContext("/youshoes").getAttribute("nid");

		request.setAttribute("nid", nid);

		ProductDAO pdao = new ProductDAO();
		List<pdtDTO> list = new ArrayList<pdtDTO>();
		list = pdao.productList(nid);

		request.setAttribute("plist", list);

		return "/view/sMem/shopUpdate.jsp";
	}

}
