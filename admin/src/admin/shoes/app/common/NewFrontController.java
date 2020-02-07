package admin.shoes.app.common;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.shoes.app.command.getDeptCnt;


@WebServlet("*.do") // localhost/model1/ //.do
public class NewFrontController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	HashMap<String, Command> cont = new HashMap<String, Command>();

	public NewFrontController() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		// 해쉬맵 구조를 put() 시켜준다.
		// cont.put("/index.do", new IndexCommand()); // 홈페이지 호출
		// board
		// 등록

		// 수정
		// 삭제
		// 상세보기
		// 목록
		// 수정폼
		// 등록폼
		// member
		
		//ajax
		
		//사용자관리
		
		//파일업로드

		//차트데이터
		cont.put("/ajax/getDeptCnt.do", new getDeptCnt());
		
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
			if (page != null & page.isEmpty()) {
				if (page.startsWith("redirected:")) {
					String view = page.substring(9);
					response.sendRedirect(view);
				}
			} else if (page.startsWith("ajax:")) {
				response.getWriter().append(page.substring(5));
			} else if (page.startsWith("script:")) {
				response.getWriter().append("<script>").append(page.substring(7)).append("<script>");
			} else {
				request.getRequestDispatcher(page).forward(request, response);
			}
		}

	}

}
