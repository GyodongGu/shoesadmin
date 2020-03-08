package admin.shoes.app.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.ProductDAO;
import admin.shoes.app.dao.optDAO;

public class DeleteProductCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		ProductDAO pdao = new ProductDAO();
		String pdtno = request.getParameter("pdt_no");
		optDAO odao = new optDAO();
		String pdtsize = request.getParameter("pdt_size_cd");
		
		int count = odao.countOpt(Integer.parseInt(pdtno));
		
		if(count==1) {	//opt가 1개일 경우 제품과 옵션을 둘다 삭제
			int opt = odao.deleteOpt(Integer.parseInt(pdtno),Integer.parseInt(pdtsize));
			int result = pdao.deleteProduct(Integer.parseInt(pdtno));
			return "ajax:"+result;
		}else if(count==0) {	//opt가 없는 경우 맞춤화제품정보 삭제
			int result = pdao.deleteProduct(Integer.parseInt(pdtno));
			return "ajax:"+result;
		}else {	//opt가 다수의 숫자일 경우 해당 opt정보 삭제
			int opt = odao.deleteOpt(Integer.parseInt(pdtno),Integer.parseInt(pdtsize));
			return "ajax:"+opt;
		}
		
	}

}
