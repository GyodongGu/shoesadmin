package admin.shoes.app.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.smDAO;
import admin.shoes.app.dto.smDTO;

public class ShopUpdateCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		HttpSession httpsession = request.getSession();

		String nid = (String) httpsession.getServletContext().getContext("/youshoes").getAttribute("nid");
				
		request.setAttribute("nid", nid);
		
		String smpw = request.getParameter("sm_pw");
		String shopname=request.getParameter("shop_name");
		String smname=request.getParameter("sm_name");
		String smtell=request.getParameter("sm_tell");
		String businessno=request.getParameter("business_no");
		String smpost=request.getParameter("sm_post");
		String smaddr1=request.getParameter("sm_addr1");
		String smaddr2=request.getParameter("sm_addr2");
		String smaddr3=request.getParameter("sm_addr3");
		String smremark=request.getParameter("sm_remark");
		String smtime=request.getParameter("sm_time");
		String smrest=request.getParameter("sm_rest");
		
		smDAO smdao = new smDAO();
		smDTO smdto = new smDTO();
		
		//shopname, pw, name, tell, post, addr123,remark, time, rest, id
		smdto.setShop_name(shopname);
		smdto.setSm_name(smname);
		smdto.setSm_pw(smpw);
		smdto.setSm_tell(smtell);
		smdto.setBusiness_no(Integer.parseInt(businessno));
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
