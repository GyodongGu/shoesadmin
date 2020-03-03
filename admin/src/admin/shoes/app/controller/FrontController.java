package admin.shoes.app.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.shoes.app.command.DeleteSmemCommand;
import admin.shoes.app.command.InsertEventCommand;
import admin.shoes.app.command.InsertSmemCommand;
import admin.shoes.app.command.SetHoliday;
import admin.shoes.app.command.UpdateSmemCommand;
import admin.shoes.app.command.backupCommand;
import admin.shoes.app.command.codeManageCommand;
import admin.shoes.app.command.eventManageCommand;
import admin.shoes.app.command.getDeptCnt;
import admin.shoes.app.command.sMemManageCommand;
import admin.shoes.app.common.Command;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String charset = null;
	HashMap<String, Command> cont = new HashMap<String, Command>();

	public FrontController() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		charset = config.getInitParameter("charset");

		/* 관리자 */
		// 기타 테이블 조회
		cont.put("/codeManage.do", new codeManageCommand()); //코드ID 조회
		cont.put("/backup.do", new backupCommand()); //구매회원 백업 거래내역 조회

		// 공지사항
		cont.put("/eventManage.do", new eventManageCommand()); //공지사항 조회
		cont.put("/InsertEvent.do", new InsertEventCommand()); //공지사항 등록

		// 판매자 관리
		cont.put("/sMemManage.do", new sMemManageCommand()); //판매회원 조회
		cont.put("/InsertSmem.do", new InsertSmemCommand()); //판매회원 등록
		cont.put("/UpdateSmem.do", new UpdateSmemCommand()); //판매회원 수정
		cont.put("/DeleteSmem.do", new DeleteSmemCommand()); //판매회원 삭제

		// 매출 통계
		//		cont.put("/sMemManage.do", new sMemManageCommand());   // YouShoes의 총 매출

		/* 판매자 */
		// 매장 수정
		//		cont.put("/sMemManage.do", new sMemManageCommand());   // 매장 수정

		// 상품 등록
		//		cont.put("/sMemManage.do", new sMemManageCommand());   // 상품 등록
		//		cont.put("/sMemManage.do", new sMemManageCommand());   // 상품 수정
		//		cont.put("/sMemManage.do", new sMemManageCommand());   // 상품 삭제

		// 배송 관리 
		//		cont.put("/sMemManage.do", new sMemManageCommand());   // delivery 테이블 수정

		// 고객 관리
		//		cont.put("/sMemManage.do", new sMemManageCommand());   // 구매한 구매회원 조회

		// 일정 등록
		cont.put("/ajax/SetHoliday.do", new SetHoliday()); //일정 업로드
		cont.put("/ajax/getDeptCnt.do", new getDeptCnt()); //차트데이터

		// 매출 통계
		//		cont.put("/sMemManage.do", new sMemManageCommand());   // 판매자별 총 매출

	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 실행할class 객체를 찾아주는 부분, get메소드로
		request.setCharacterEncoding("UTF-8"); // 한글처리

		String uri = request.getRequestURI();
		String context = request.getContextPath();
		String path = uri.substring(context.length());

		Command commandImpl = cont.get(path); // 실행 클래스를 선택한다 

		String page = null;

		response.setContentType("text/html; charset=UTF-8");

		if (commandImpl != null) {
			page = commandImpl.execute(request, response);
			//System.out.println(page);
			if (page != null && !page.isEmpty()) {
				if (page.startsWith("redirect:")) {
					String view = page.substring(9);
					response.sendRedirect(view);
				} else if (page.startsWith("ajax:")) {
					response.getWriter().append(page.substring(5));
				} else if (page.startsWith("script:")) {
					response.getWriter().append("<script>").append(page.substring(7)).append("</script>");
				} else {
					request.getRequestDispatcher(page).forward(request, response);
				}
			}
		} else {
			response.getWriter().append("잘못된 요청입니다.");
		}
	}

}
