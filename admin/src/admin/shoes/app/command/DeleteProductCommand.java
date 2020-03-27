package admin.shoes.app.command;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.ProductDAO;
import admin.shoes.app.dao.imageDAO;
import admin.shoes.app.dao.optDAO;
import admin.shoes.app.dto.imageDetailDTO;

public class DeleteProductCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		ProductDAO pdao = new ProductDAO();
		String pdtno = request.getParameter("pdt_no");
		optDAO odao = new optDAO();
		String pdtsize = request.getParameter("pdt_size_cd");
		
		imageDAO idao = new imageDAO();
		//실제 이미지 파일 삭제
		imageDAO deldao = new imageDAO();
		
		int count = odao.countOpt(Integer.parseInt(pdtno));
		
		optDAO oodao = new optDAO();
		if(count==1) {	//opt가 1개일 경우 제품과 옵션을 둘다 삭제
			int opt = oodao.deleteOpt(Integer.parseInt(pdtno),Integer.parseInt(pdtsize));	//opt테이블 내용삭제
			int result = pdao.deleteProduct(Integer.parseInt(pdtno));						//제품삭제
			
			//------------------------------------------------------------------------------//
			//이미지폴더내의 이미지파일 삭제
			String path=request.getSession().getServletContext().getContext("/youshoes").getRealPath("/view/img");
			List<imageDetailDTO> iname = new ArrayList<imageDetailDTO>();
			iname = deldao.prodImageName(Integer.parseInt(pdtno));
			
			for(imageDetailDTO i : iname) {
				
				path += i.getImg_name();
				System.out.println(path);
				File file = new File(path);
				file.delete();
				path =request.getSession().getServletContext().getContext("/youshoes").getRealPath("/view/img");
			}
			//------------------------------------------------------------------------------//
			
			idao.deleteProdImage(pdtno);	//이미지테이블에서 해당제품 이미지 삭제
			
			return "ajax:"+result;
		}else if(count==0) {	//opt가 없는 경우 맞춤화제품정보 삭제
			int result = pdao.deleteProduct(Integer.parseInt(pdtno));	//제품삭제
			
			//------------------------------------------------------------------------------//
			String path=request.getSession().getServletContext().getContext("/youshoes").getRealPath("/view/img");
			List<imageDetailDTO> iname = new ArrayList<imageDetailDTO>();
			iname = deldao.prodImageName(Integer.parseInt(pdtno));
			
			for(imageDetailDTO i : iname) {
				
				path += i.getImg_name();
				File file = new File(path);
				System.out.println(path);
				file.delete();
				path =request.getSession().getServletContext().getContext("/youshoes").getRealPath("/view/img");
			}
			//------------------------------------------------------------------------------//
			
			idao.deleteProdImage(pdtno);	//이미지테이블에서 해당제품 이미지 삭제
			
			return "ajax:"+result;
		}else {	//opt가 다수의 숫자일 경우 해당 opt정보 삭제
			int opt = oodao.deleteOpt(Integer.parseInt(pdtno),Integer.parseInt(pdtsize));
			return "ajax:"+opt;
		}
		
	}

}
