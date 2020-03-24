package admin.shoes.app.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import admin.shoes.app.dto.StatisticsDTO;
import admin.shoes.app.dto.imageDetailDTO;
import admin.shoes.app.dto.ordDTO;
import admin.shoes.app.dto.pdtDTO;

/**
 * 
 * @author 구교동, 유승우
 * 1.
 * 2. 관리자 YouShoes의 총 매출   YouShoesStatistics()
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
		
		
		String sql = "select to_char(ord_date, 'yyyy') y, sum(ord_point) as sumOrd " 
				   + "from ord o join ord_detail od " 
				   + "on o.ord_no = od.ord_no " 
				   + "where add_months(sysdate, -60) < ord_date "
				   + "group by to_char(ord_date, 'yyyy') "
				   + "order by 1";
		System.out.println(sql);
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
}
