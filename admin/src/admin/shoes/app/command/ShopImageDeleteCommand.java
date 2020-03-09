package admin.shoes.app.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.imageDAO;

public class ShopImageDeleteCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		int result=0;
		
		String imgno=request.getParameter("img_no");
		System.out.println(imgno);
		imageDAO idao = new imageDAO();
		result = idao.deleteShopImage(Integer.parseInt(imgno));
		
		return "ajax:"+result;
	}

}
