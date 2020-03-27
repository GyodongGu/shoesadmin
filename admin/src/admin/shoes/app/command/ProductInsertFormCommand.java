package admin.shoes.app.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.CodeDAO;
import admin.shoes.app.dto.codeDTO;

public class ProductInsertFormCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		HttpSession httpsession = request.getSession();
		String nid = (String) httpsession.getServletContext().getContext("/youshoes").getAttribute("nid");
		
		
		CodeDAO cdao = new CodeDAO();
		List<codeDTO> colorlist = new ArrayList<codeDTO>();
		colorlist = cdao.SelectOneType("색상");
		
		CodeDAO ccdao = new CodeDAO();
		List<codeDTO> sizelist = new ArrayList<codeDTO>();
		sizelist = ccdao.SelectOneType("사이즈");
		
		request.setAttribute("nid", nid);
		request.setAttribute("clist", colorlist);
		request.setAttribute("slist", sizelist);
		
		return "/view/sMem/product.jsp";
	}

}
