package admin.shoes.app.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.shoes.app.command.InsertEventCommand;
import admin.shoes.app.command.SetHoliday;
import admin.shoes.app.command.backupCommand;
import admin.shoes.app.command.codeManageCommand;
import admin.shoes.app.command.getDeptCnt;
import admin.shoes.app.command.sMemManageCommand;
import admin.shoes.app.common.Command;


@WebServlet("*.do") 
public class FrontController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	HashMap<String, Command> cont = new HashMap<String, Command>();

	public FrontController() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		/* 관리자 */
		cont.put("/codeManage.do", new codeManageCommand());  //코드ID 조회
		cont.put("/backup.do", new backupCommand());  //구매회원 백업 거래내역 조회
		cont.put("/InsertEvent.do", new InsertEventCommand());    //공지사항 등록
		cont.put("/sMemManage.do", new sMemManageCommand());   //판매회원 등록
		
		
		/* 판매자 */
		cont.put("/ajax/SetHoliday.do", new SetHoliday());  //일정 업로드
		cont.put("/ajax/getDeptCnt.do", new getDeptCnt());  //차트데이터
		
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 실행할 class 객체를 찾아주는 부분
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		String path = uri.substring(context.length());
		// 로그 처리
		System.out.println("path=" + path);
		// 권한 체크 (로그인체크)
		Command commandImpl = cont.get(path);
		String page = null;
		response.setContentType("text/html; charset=UTF-8");
		if (commandImpl != null) {
			page = commandImpl.execute(request, response);
			if (page != null & !page.isEmpty()) {
				if (page.startsWith("redirected:")) {
					String view = page.substring(9);
					response.sendRedirect(view);
				} else if (page.startsWith("ajax:")) {
					System.out.println(page.substring(5));
					response.getWriter().append(page.substring(5));
				} else if (page.startsWith("script:")) {
					response.getWriter().append("<script>").append(page.substring(7)).append("<script>");
				} else {
					request.getRequestDispatcher(page).forward(request, response);
				}
			}
		}else {
			response.getWriter().append("없는 명령어 입니다");
		}

	}

}
