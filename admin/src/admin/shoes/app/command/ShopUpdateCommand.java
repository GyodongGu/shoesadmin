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
import admin.shoes.app.dao.imageDAO;
import admin.shoes.app.dao.smDAO;
import admin.shoes.app.dto.imageDetailDTO;
import admin.shoes.app.dto.smDTO;

public class ShopUpdateCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		String directory = request.getSession().getServletContext().getContext("/youshoes").getRealPath("/view/img");
		int maxsize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
		
		MultipartRequest multi = new MultipartRequest(request, directory, maxsize, encoding, new DefaultFileRenamePolicy());

		
		//세션처리
		HttpSession httpsession = request.getSession();
		String nid = (String) httpsession.getServletContext().getContext("/youshoes").getAttribute("nid");
		request.setAttribute("nid", nid);
		
		//상점 이미지 등록
		Enumeration fileNames = multi.getFileNames();
		while (fileNames.hasMoreElements()) {
			String parameter = (String) fileNames.nextElement();
			String fileName = multi.getOriginalFileName(parameter);
			String fileRealName = multi.getFilesystemName(parameter);

			if (fileName == null)
				continue;

			if (!fileName.endsWith(".jpg") && !fileName.endsWith(".png") && !fileName.endsWith(".JPG")) {
				File file = new File(directory + fileRealName);
				file.delete();

			} else {
				imageDAO idao = new imageDAO();
				imageDetailDTO iddto = new imageDetailDTO();

				iddto.setImg_name(fileRealName);
				iddto.setImg_size(10);
				idao.insertShopImage(iddto, nid);
			}
		}
		
		
		
		//상점정보 업데이트
		String smpw = multi.getParameter("sm_pw");
		String shopname=multi.getParameter("shop_name");
		String smname=multi.getParameter("sm_name");
		String smtell=multi.getParameter("sm_tell");
		String businessno=multi.getParameter("business_no");
		String smpost=multi.getParameter("sm_post");
		String smaddr1=multi.getParameter("sm_addr1");
		String smaddr2=multi.getParameter("sm_addr2");
		String smaddr3=multi.getParameter("sm_addr3");
		String smremark=multi.getParameter("sm_remark");
		String smtime=multi.getParameter("sm_time");
		String smrest=multi.getParameter("sm_rest");
		
		smDAO smdao = new smDAO();
		smDTO smdto = new smDTO();
		
		//shopname, pw, name, tell, post, addr123,remark, time, rest, id
		smdto.setShop_name(shopname);
		smdto.setSm_name(smname);
		smdto.setSm_pw(smpw);
		smdto.setSm_tell(smtell);
		smdto.setBusiness_no(businessno);
		smdto.setSm_post(smpost);
		smdto.setSm_addr1(smaddr1);
		smdto.setSm_addr2(smaddr2);
		smdto.setSm_addr3(smaddr3);
		smdto.setSm_remark(smremark);
		smdto.setSm_time(smtime);
		smdto.setSm_rest(smrest);
		smdto.setSm_id(nid);
		
		smdao.updateShop(smdto);
		
		
		
		return "/shopManage.do";
	}

}
