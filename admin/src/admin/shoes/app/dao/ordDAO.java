package admin.shoes.app.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import admin.shoes.app.dto.StatisticsDTO;
import admin.shoes.app.dto.imageDetailDTO;
import admin.shoes.app.dto.ordDTO;
import admin.shoes.app.dto.pdtDTO;

/**
 * 
 * @author 구교동
 * 1.
 * 
 * @author 유승우
 * 2. 관리자 YouShoes의 총 매출   YouShoesStatistics()
 * 3. 판매 회원별 연 매출  sMemStatistics()
 * 4. 판매 회원별 월 매출  sMonthStatistics()
 * 5. 판매 회원별 주 매출  sWeekStatistics()
 * 6. 판매 회원별 일 매출  sDayStatistics()
 * 7. 판매 회원별 판매 품목 sProductStatistics()
 * 8. 판매 회원별 구매한 성비 sSexStatistics()
 */

public class ordDAO extends DAO{
	// 1.
	public List<ordDTO> ordList(int pmno){
		List<ordDTO> list = new ArrayList<ordDTO>();
		
		String sql = "select * from ord where pm_no=?";
		String sql1 = "select * from product where pdt_no=?";
		String sql2="select img_name, i.img_no from image i join image_detail d on i.img_no=d.img_no where section='I02' and section_no=?";
		PreparedStatement psmt1;
		ResultSet rs1;
		
		PreparedStatement psmt2;
		ResultSet rs2;
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, pmno);
			
			rs=psmt.executeQuery();
			
			while(rs.next()) {
				ordDTO odto = new ordDTO();
				odto.setOrd_no(rs.getInt("ord_no"));
				odto.setPm_no(rs.getInt("pm_no"));
				odto.setPdt_no(rs.getInt("pdt_no"));
				odto.setOrd_date(rs.getDate("ord_date"));
				odto.setOrd_point(rs.getInt("ord_point"));
				odto.setOrd_stat_cd(rs.getString("ord_stat_cd"));
				
				psmt1=conn.prepareStatement(sql1);
				psmt1.setInt(1, rs.getInt("pdt_no"));
				rs1=psmt1.executeQuery();
				if(rs1.next()) {
					pdtDTO pdto = new pdtDTO();
					pdto.setPdt_name(rs1.getString("pdt_name"));
					
					psmt2=conn.prepareStatement(sql2);
					psmt2.setInt(1, rs.getInt("pdt_no"));
					rs2=psmt2.executeQuery();
					List<imageDetailDTO> imgList=new ArrayList<imageDetailDTO>();
					while(rs2.next()) {
						imageDetailDTO imgDTO = new imageDetailDTO();
						imgDTO.setImg_name(rs2.getString("img_name"));
						imgDTO.setImg_no(rs2.getInt("img_no"));
						imgList.add(imgDTO);
					}
					pdto.setImg_name(imgList);
					odto.setPdto(pdto);
				}
				
				list.add(odto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// 2. 관리자 YouShoes의 총 매출   YouShoesStatistics()
	public List<StatisticsDTO> YouShoesStatistics() {
		List<StatisticsDTO> list = new ArrayList<StatisticsDTO>();
		String sql = "select to_char(ord_date, 'yyyy') y, sum(ord_detail_point) as sumOrd " 
				   + "from ord o join ord_detail od " 
				   + "on o.ord_no = od.ord_no " 
				   + "where add_months(sysdate, -60) < ord_date "
				   + "group by to_char(ord_date, 'yyyy') "
				   + "order by 1";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				StatisticsDTO sdto = new StatisticsDTO();
				sdto.setSumOrd(rs.getInt("sumOrd"));
				sdto.setYear(rs.getString("y"));
				
				list.add(sdto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	// 3. 판매 회원별 년 매출  sMemStatistics()
	public List<StatisticsDTO> sMemStatistics(String id) {
		List<StatisticsDTO> list = new ArrayList<StatisticsDTO>();
		String sql = "select to_char(ord_date, 'yyyy') y, sum(ord_detail_point) as sumOrd " 
				   + "from ord o, ord_detail od,  product p " 
				   + "where sm_id = ? " 
				   + "and o.ord_no = od.ord_no " 
				   + "and o.pdt_no = p.pdt_no "
				   + "and add_months(sysdate, -60) < ord_date " 
				   + "group by to_char(ord_date, 'yyyy') "
				   + "order by 1";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				StatisticsDTO sdto = new StatisticsDTO();
				sdto.setSumOrd(rs.getInt("sumOrd"));
				sdto.setYear(rs.getString("y"));
				
				list.add(sdto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	// 4. 판매 회원별 월 매출  sMonthStatistics()
	public List<StatisticsDTO> sMonthStatistics(String varYearSelect, String id) {
		List<StatisticsDTO> list = new ArrayList<StatisticsDTO>();
		String sql = "select to_char(ord_date, 'yyyymm') y, sum(ord_detail_point) as sumOrd " 
					+ "from ord o, ord_detail od,  product p " 
					+ "where add_months(sysdate, -60) < ord_date " 
					+ "and to_char(ord_date, 'yyyy') = ? " 
					+ "and sm_id = ? " 
					+ "and o.ord_no = od.ord_no " 
					+ "and o.pdt_no = p.pdt_no " 
					+ "group by to_char(ord_date, 'yyyymm') " 
					+ "order by 1";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, varYearSelect);
			psmt.setString(2, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				StatisticsDTO sdto = new StatisticsDTO();
				sdto.setSumOrd(rs.getInt("sumOrd"));
				sdto.setYear(rs.getString("y"));
				
				list.add(sdto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	// 5. 판매 회원별 주 매출  sWeekStatistics()
	public List<StatisticsDTO> sWeekStatistics(String id) {
		List<StatisticsDTO> list = new ArrayList<StatisticsDTO>();
		String sql = " ";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				StatisticsDTO sdto = new StatisticsDTO();
				sdto.setSumOrd(rs.getInt("sumOrd"));
				sdto.setYear(rs.getString("y"));
				
				list.add(sdto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	// 6. 판매 회원별 일 매출  sDayStatistics()
	public List<StatisticsDTO> sDayStatistics(String id) {
		List<StatisticsDTO> list = new ArrayList<StatisticsDTO>();
		String sql = "select to_char(ord_date, 'yyyymmdd') y, sum(ord_detail_point) as sumOrd " 
					+ "from ord o, ord_detail od,  product p " 
					+ "where add_months(sysdate, -60) < ord_date " 
					+ "and to_char(ord_date, 'yyyy') = '2020' " 
					+ "and sm_id = 'manshoes01' " 
					+ "and o.ord_no = od.ord_no " 
					+ "and o.pdt_no = p.pdt_no " 
					+ "group by to_char(ord_date, 'yyyymmdd') " 
					+ "order by 1; ";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				StatisticsDTO sdto = new StatisticsDTO();
				sdto.setSumOrd(rs.getInt("sumOrd"));
				sdto.setYear(rs.getString("y"));
				
				list.add(sdto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	// 7. 판매 회원별 판매 품목 sProductStatistics()
	public List<StatisticsDTO> sProductStatistics(String id) {
		List<StatisticsDTO> list = new ArrayList<StatisticsDTO>();
		String sql = "select p.pdt_kind_cd " 
					+ "from ord o, ord_detail od,  product p " 
					+ "where sm_id = ? " 
					+ "and o.ord_no = od.ord_no " 
					+ "and o.pdt_no = p.pdt_no ";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				StatisticsDTO sdto = new StatisticsDTO();
				sdto.setSumOrd(rs.getInt("sumOrd"));
				sdto.setYear(rs.getString("y"));
				
				list.add(sdto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	// 8. 판매 회원별 구매한 성비 sSexStatistics()
	public List<StatisticsDTO> sSexStatistics(String id) {
		List<StatisticsDTO> list = new ArrayList<StatisticsDTO>();
		String sql = "select gender_cd " 
					+ "from ord o, ord_detail od,  product p " 
					+ "where sm_id = ? " 
					+ "and o.ord_no = od.ord_no " 
					+ "and o.pdt_no = p.pdt_no ";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				StatisticsDTO sdto = new StatisticsDTO();
				sdto.setSumOrd(rs.getInt("sumOrd"));
				sdto.setYear(rs.getString("y"));
				
				list.add(sdto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
}
