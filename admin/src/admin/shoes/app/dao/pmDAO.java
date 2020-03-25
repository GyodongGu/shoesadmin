package admin.shoes.app.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import admin.shoes.app.dto.pmDTO;

public class pmDAO extends DAO{
	private pmDTO dto;
	private ArrayList<pmDTO> list;

	public pmDAO() {
		super();
	}	
	
	public ArrayList<pmDTO> pmSelect() { // 1. 회원목록 전체 조회 pmSelect()
		list = new ArrayList<pmDTO>();
		String sql = "select * from purchase_member";

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				dto = new pmDTO();
				dto.setPm_no(rs.getInt("pm_no"));
				dto.setPm_id(rs.getString("pm_id"));
				dto.setPm_pw(rs.getString("pm_pw"));
				dto.setPm_name(rs.getString("pm_name"));
				CodeDAO cdao = new CodeDAO();
				String cd = cdao.CodeidToCodename(rs.getString("pm_stat_cd"));
				dto.setPm_stat_cd(cd);
				dto.setPm_birth(rs.getDate("pm_birth"));
				dto.setPm_email(rs.getString("pm_email"));
				dto.setPm_date(rs.getDate("pm_date"));
				dto.setPm_tell(rs.getString("pm_tell"));
				dto.setPm_post(rs.getString("pm_post"));
				dto.setPm_addr1(rs.getString("pm_addr1"));
				dto.setPm_addr2(rs.getString("pm_addr2"));
				dto.setPm_addr3(rs.getString("pm_addr3"));
				dto.setPoint_now(rs.getInt("point_now"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public ArrayList<pmDTO> pmListOfSm(String smid){
		list = new ArrayList<pmDTO>();
		
		String sql ="select distinct pm.* from purchase_member pm join ord o on pm.pm_no=o.pm_no "
				+ " join product pr on o.pdt_no=pr.pdt_no "
				+ " where sm_id=?";
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, smid);
			
			rs=psmt.executeQuery();
			
			while(rs.next()) {
				dto = new pmDTO();
				dto.setPm_no(rs.getInt("pm_no"));
				dto.setPm_id(rs.getString("pm_id"));
				dto.setPm_name(rs.getString("pm_name"));
				dto.setPm_stat_cd(rs.getString("pm_stat_cd"));
				dto.setPm_birth(rs.getDate("pm_birth"));
				dto.setPm_email(rs.getString("pm_email"));
				dto.setPm_date(rs.getDate("pm_date"));
				dto.setPm_tell(rs.getString("pm_tell"));
				dto.setPm_post(rs.getString("pm_post"));
				dto.setPm_addr1(rs.getString("pm_addr1"));
				dto.setPm_addr2(rs.getString("pm_addr2"));
				dto.setPm_addr3(rs.getString("pm_addr3"));
				
				list.add(dto);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		
		return list;
	}
}
