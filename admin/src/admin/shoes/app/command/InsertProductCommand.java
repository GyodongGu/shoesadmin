package admin.shoes.app.command;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.ProductDAO;
import admin.shoes.app.dao.imageDAO;
import admin.shoes.app.dto.imageDetailDTO;
import admin.shoes.app.dto.pdtDTO;



public class InsertProductCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		String directory="C:/Users/교동/git/youshoes/youshoes/WebContent/view/img/";
		int maxsize=1024*1024*100;
		String encoding="UTF-8";
		
		
		MultipartRequest multi = new MultipartRequest(request, directory, maxsize, encoding, new DefaultFileRenamePolicy());
		
		ProductDAO pdao = new ProductDAO();
		pdtDTO pdto = new pdtDTO();
		HttpSession httpsession = request.getSession();
		String nid = (String) httpsession.getServletContext().getContext("/youshoes").getAttribute("nid");
		request.setAttribute("nid", nid);
		
		String price = multi.getParameter("pdt_price");
		
		pdto.setPdt_name(multi.getParameter("pdt_name"));
		pdto.setSm_id(nid);
		pdto.setPdt_type_cd(multi.getParameter("pdt_type_cd"));
		pdto.setPdt_kind_cd(multi.getParameter("pdt_kind_cd"));
		pdto.setGender_cd(multi.getParameter("gender_cd"));
		pdto.setPdt_price(Integer.parseInt(price));
		
		pdao.insertProduct(pdto);
		
		Enumeration fileNames = multi.getFileNames();
		while(fileNames.hasMoreElements()) {
			String parameter = (String) fileNames.nextElement();
			String fileName = multi.getOriginalFileName(parameter);
			String fileRealName = multi.getFilesystemName(parameter);
			
			if(fileName ==null) continue;
			
			if(!fileName.endsWith(".jpg") && !fileName.endsWith(".png")) {
				File file = new File(directory + fileRealName);
				file.delete();
				
			}else {
				imageDAO idao = new imageDAO();
				imageDetailDTO iddto = new imageDetailDTO();
				
				iddto.setImg_name(fileRealName);
				iddto.setImg_size(10);
				idao.insertProductImage(iddto);
			}
		}
		
		return "/sMem.do";
	}

}
