package admin.shoes.app.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.shoes.app.command.AdminStatisticsCommand;
import admin.shoes.app.command.AjaxAdminStatisticsCommand;
import admin.shoes.app.command.DelHoliday;
import admin.shoes.app.command.DelHolidayImportcommand;
import admin.shoes.app.command.DeleteEventCommand;
import admin.shoes.app.command.DeleteProductCommand;
import admin.shoes.app.command.DeleteSmemCommand;
import admin.shoes.app.command.DeliveryCommand;
import admin.shoes.app.command.GetHoliday;
import admin.shoes.app.command.GetReservCommand;
import admin.shoes.app.command.GuestOrdList;
import admin.shoes.app.command.IdOverlapCommand;
import admin.shoes.app.command.InsertEventCommand;
import admin.shoes.app.command.InsertEventFormCommand;
import admin.shoes.app.command.InsertOkCommand;
import admin.shoes.app.command.InsertProductCommand;
import admin.shoes.app.command.InsertSmemCommand;
import admin.shoes.app.command.MyGuestListCommand;
import admin.shoes.app.command.ProductInsertFormCommand;
import admin.shoes.app.command.ProductStatisticsCommand;
import admin.shoes.app.command.RefundListCommand;
//github.com/GyodongGu/shoesadmin.git
import admin.shoes.app.command.SMemCommand;
import admin.shoes.app.command.SMemYearStatisticsCommand;
import admin.shoes.app.command.SetDeliveryCommand;
import admin.shoes.app.command.SetHoliday;
import admin.shoes.app.command.SetHolidayImportCommand;
import admin.shoes.app.command.SetOrdTypeCommand;
import admin.shoes.app.command.SexStatisticsCommand;
import admin.shoes.app.command.ShopImageDeleteCommand;
import admin.shoes.app.command.ShopManageCommand;
import admin.shoes.app.command.ShopUpdateCommand;
import admin.shoes.app.command.ShopUpdateFormCommand;
import admin.shoes.app.command.SiteMeshCommand;
import admin.shoes.app.command.UpdateEventCommand;
import admin.shoes.app.command.UpdateEventFormCommand;
import admin.shoes.app.command.UpdateSmemCommand;
import admin.shoes.app.command.UpdateSmemFormCommand;
import admin.shoes.app.command.allGuestCommand;
import admin.shoes.app.command.backupCommand;
import admin.shoes.app.command.codeManageCommand;
import admin.shoes.app.command.eventManageCommand;
import admin.shoes.app.command.logoutCommand;
import admin.shoes.app.command.sDayStatisticsCommand;
import admin.shoes.app.command.sMemManageCommand;
import admin.shoes.app.command.sMemStatisticsCommand;
import admin.shoes.app.command.sMonthStatisticsCommand;
import admin.shoes.app.command.sWeekStatisticsCommand;
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

		// 메인 페이지
		cont.put("/sMem.do", new SMemCommand());             //main페이지
		cont.put("/siteMesh.do", new SiteMeshCommand());     // 로그인한 계정 종류에 따라 메뉴바 표시
		
		/* 관리자 */
		// 기타 테이블 조회
		cont.put("/codeManage.do", new codeManageCommand()); // 코드ID 조회
		cont.put("/allGuest.do", new allGuestCommand()); // 구매회원 목록
		cont.put("/backup.do", new backupCommand()); // 백업 거래내역 조회

		// 공지사항
		cont.put("/eventManage.do", new eventManageCommand()); //공지사항 조회
		
		cont.put("/InsertEvent.do", new InsertEventCommand()); //공지사항 등록
		cont.put("/InsertEventForm.do", new InsertEventFormCommand()); //공지사항 등록 폼
		cont.put("/UpdateEvent.do", new UpdateEventCommand()); //공지사항 수정
		cont.put("/UpdateEventForm.do", new UpdateEventFormCommand()); //공지사항 수정 폼
		
		cont.put("/DeleteEvent.do", new DeleteEventCommand()); //공지사항 삭제

		// 판매자 관리
		cont.put("/sMemManage.do", new sMemManageCommand()); //판매회원 조회
		cont.put("/InsertSmem.do", new InsertSmemCommand()); //판매회원 등록
		cont.put("/IdOverlap.do", new IdOverlapCommand()); //판매회원 아이디 중복검사
		cont.put("/InsertOk.do", new InsertOkCommand()); //판매회원 등록 확인
		cont.put("/UpdateSmem.do", new UpdateSmemCommand()); //판매회원 수정
		cont.put("/UpdateSmemForm.do", new UpdateSmemFormCommand()); //판매회원 수정 폼
		cont.put("/DeleteSmem.do", new DeleteSmemCommand()); //판매회원 삭제
		cont.put("/logout.do", new logoutCommand()); // 로그아웃

		// 매출 통계
		// cont.put("/sMemManage.do", new sMemManageCommand()); // YouShoes의 총 매출

		/* 판매자 */
		// 매장 수정
		cont.put("/shopManage.do", new ShopManageCommand()); // 매장 관리
		cont.put("/shopUpdateForm.do", new ShopUpdateFormCommand()); // 매장(판매자)업데이트 페이지
		cont.put("/shopUpdate.do", new ShopUpdateCommand()); // 매장(판매자)정보 업데이트
		cont.put("/ajax/deleteShopImage.do", new ShopImageDeleteCommand());// 상점 이미지 삭제
		// 상품 등록
		cont.put("/productInsertForm.do", new ProductInsertFormCommand()); // 상품등록페이지
		cont.put("/productInsert.do", new InsertProductCommand()); // 상품 등록
		// cont.put("/sMemManage.do", new sMemManageCommand()); // 상품 수정
		cont.put("/ajax/deleteProd.do", new DeleteProductCommand()); // 상품 삭제

		// 배송 관리
		cont.put("/delivery.do", new DeliveryCommand()); // 딜리버리 조회
		cont.put("/SetDelivery.do", new SetDeliveryCommand()); // 송장번호 수정
		cont.put("/SetOrdType.do", new SetOrdTypeCommand()); // 제장상태 수정

		// 고객 관리
		cont.put("/myGuestList.do", new MyGuestListCommand()); // 구매한 구매회원 조회
		cont.put("/GuestOrdList.do", new GuestOrdList()); // 구매한 구매회원의 구매내역조회

		// 일정 등록
		cont.put("/ajax/SetHoliday.do", new SetHoliday()); // 일정 업로드
		cont.put("/ajax/GetHoliday.do", new GetHoliday()); // 휴일 가져오기
		cont.put("/ajax/DelHoliday.do", new DelHoliday()); // 휴일 삭제
		cont.put("/ajax/GetReserv.do", new GetReservCommand()); // 예약일정 가져오기
		cont.put("/ajax/SetHolidayImport.do", new SetHolidayImportCommand()); //정기휴일 등록
		cont.put("/ajax/DelHolidayImport.do", new DelHolidayImportcommand()); //정기휴일 취소

		// 매출 통계
		cont.put("/AdminStatistics.do", new AdminStatisticsCommand()); // 관리자의 총 매출 메인 페이지
		cont.put("/ajax/AdminStatistics.do", new AjaxAdminStatisticsCommand()); // 관리자의 총 매출 메인 페이지
		
		cont.put("/sMemStatistics.do", new sMemStatisticsCommand()); // 판매자별 매출 메인 페이지
		cont.put("/ajax/SMemYearStatistics.do", new SMemYearStatisticsCommand()); // 판매자별 매출 연 매출
		cont.put("/ajax/sMonthStatistics.do", new sMonthStatisticsCommand()); // 판매자별 월 매출
		cont.put("/ajax/sWeekStatistics.do", new sWeekStatisticsCommand()); // 판매자별 주 매출
		cont.put("/ajax/sDayStatistics.do", new sDayStatisticsCommand()); // 판매자별 일 매출
		cont.put("/ajax/ProductStatistics.do", new ProductStatisticsCommand()); // 판매자별 판매한 상품 목록 
		cont.put("/ajax/SexStatistics.do", new SexStatisticsCommand()); // 판매자별 제품 구매한 성비
		
		cont.put("/RefundList.do", new RefundListCommand());	//환불 목록

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
			// System.out.println(page);
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
