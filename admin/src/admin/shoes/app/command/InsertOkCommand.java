package admin.shoes.app.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.smDAO;
import admin.shoes.app.dto.smDTO;

public class InsertOkCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		smDAO dao = new smDAO();
		smDTO dto = new smDTO();
		
		
		//Parameter 추출
		dto.setSm_id(request.getParameter("sm_id"));
		dto.setShop_name(request.getParameter("shop_name"));
		dto.setSm_pw(request.getParameter("sm_pw"));
		dto.setSm_name(request.getParameter("sm_name"));
		dto.setSm_tell(request.getParameter("sm_tell"));
		dto.setBusiness_no(request.getParameter("business_no"));
		dto.setSm_post(request.getParameter("sm_post"));
		dto.setSm_addr1(request.getParameter("sm_addr1"));
		dto.setSm_addr2(request.getParameter("sm_addr2"));
		dto.setSm_addr3(request.getParameter("sm_addr3"));
		dto.setSm_remark(request.getParameter("sm_remark"));
		int n = dao.smInsert(dto);
		
		request.setAttribute("pass", n);
		return "/view/Admin/InsertOk.jsp";
	}

}
