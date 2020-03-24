package admin.shoes.app.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.smDAO;
import admin.shoes.app.dto.smDTO;

public class DeleteSmemCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		HttpSession httpsession = request.getSession();
		
		smDAO sdao = new smDAO();
		smDTO sdto = new smDTO();
		
		String smid = request.getParameter("sm_id");
		System.out.println("삭제할 sm_id:"+smid);
		sdto.setSm_id(smid);
		
		sdao.smDelete(sdto);
		
		request.setAttribute("smDelete", smid);
		
		return "/sMemManage.do";
	}

}
