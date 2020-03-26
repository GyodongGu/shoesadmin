package admin.shoes.app.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.shoes.app.common.Command;
import admin.shoes.app.dao.ordDAO;
import admin.shoes.app.dto.SexRatioDTO;
import net.sf.json.JSONArray;

public class SexStatisticsCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		ordDAO odao = new ordDAO();

		HttpSession httpsession = request.getSession();
		String nid = (String) httpsession.getServletContext().getContext("/youshoes").getAttribute("nid");
		
		List<SexRatioDTO> sMemSexStat = odao.sSexStatistics(nid);
		
		String jsonArray = JSONArray.fromObject(sMemSexStat).toString(); 
		
		return "ajax:" + jsonArray;
	}

}
