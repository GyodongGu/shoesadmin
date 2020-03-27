package admin.shoes.app.command;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.ProductDAO;
import admin.shoes.app.dao.imageDAO;
import admin.shoes.app.dao.optDAO;
import admin.shoes.app.dto.imageDetailDTO;
import admin.shoes.app.dto.optDTO;
import admin.shoes.app.dto.pdtDTO;

public class InsertProductCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		
		String directory = request.getSession().getServletContext().getContext("/youshoes").getRealPath("/view/img");
		int maxsize = 1024 * 1024 * 100;
		String encoding = "UTF-8";

		MultipartRequest multi = new MultipartRequest(request, directory, maxsize, encoding, new DefaultFileRenamePolicy());

		ProductDAO pdao = new ProductDAO();
		pdtDTO pdto = new pdtDTO();
		HttpSession httpsession = request.getSession();
		String nid = (String) httpsession.getServletContext().getContext("/youshoes").getAttribute("nid");
		request.setAttribute("nid", nid);
		
		int pdtno = pdao.pdtno(multi.getParameter("pdt_name"));
		ProductDAO ppdao = new ProductDAO();
		if(pdtno==0) {
			//제품등록
			String price = multi.getParameter("pdt_price");

			pdto.setPdt_name(multi.getParameter("pdt_name"));
			pdto.setSm_id(nid);
			pdto.setPdt_type_cd(multi.getParameter("pdt_type_cd"));
			pdto.setPdt_kind_cd(multi.getParameter("pdt_kind_cd"));
			pdto.setGender_cd(multi.getParameter("gender_cd"));
			pdto.setPdt_price(Integer.parseInt(price));
			pdto.setPdt_remark(multi.getParameter("pdt_remark"));

			ppdao.insertProduct(pdto);
		}
		
		//제품옵션추가
		String cnt = multi.getParameter("count");
		
		optDAO odao = new optDAO();
		optDTO odto = new optDTO();
		

		String[] size = multi.getParameterValues("pdt_size_cd");
		
		
		System.out.println(size.length);
		
		if (!size[0].equals("")&& multi.getParameter("pdt_type_cd").equals("P")) {
			String[] rescolor=new String[Integer.parseInt(cnt)];
			for(int c =1; c<=Integer.parseInt(cnt); c++) {
				String[] color = multi.getParameterValues("pdt_color_cd"+c);
				
				rescolor[c-1]=StringUtils.join(color, ',');
			}
			
			//String resultcolor = StringUtils.join(color, ',');

			for (int i = 0; i < size.length; i++) {
				
				odto.setPdt_no(pdtno);
				odto.setPdt_size_cd(Integer.parseInt(size[i]));
				odto.setPdt_color_cd(rescolor[i]);
				odao.insertOpt(odto);
			}
		}

		//이미지 파일 업로드
		Enumeration fileNames = multi.getFileNames();
		while (fileNames.hasMoreElements()) {
			String parameter = (String) fileNames.nextElement();
			String fileName = multi.getOriginalFileName(parameter);
			String fileRealName = multi.getFilesystemName(parameter);

			if (fileName == null)
				continue;

			if (!fileName.endsWith(".jpg") && !fileName.endsWith(".png")) {
				File file = new File(directory + fileRealName);
				file.delete();

			} else {
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
