package admin.shoes.app.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import admin.shoes.app.dto.imageDetailDTO;
import admin.shoes.app.dto.smDTO;

/**
 * 
 * @author 유승우 
 * 1. 판매회원 전체조회 smSelect() 
 * 2. 판매회원 등록 smInsert() 
 * 3. 판매회원 수정 smUpdate() 
 * 4. 판매회원 삭제 smDelete()
 *
 */

public class smDAO extends DAO {
	// 1. 판매회원 전체 조회    smSelect()
	public List<smDTO> smSelect() {
		List<smDTO> list = new ArrayList<smDTO>();
		String sql = "select * from sales_member";

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				smDTO smdto = new smDTO();
				smdto.setSm_id(rs.getString("sm_id"));
				smdto.setShop_name(rs.getString("shop_name"));
				smdto.setSm_pw(rs.getString("sm_pw"));
				smdto.setSm_name(rs.getString("sm_name"));
				smdto.setSm_tell(rs.getString("sm_tell"));
				smdto.setBusiness_no(rs.getString("business_no"));
				smdto.setSm_date(rs.getDate("sm_date"));
				smdto.setSm_post(rs.getString("sm_post"));
				smdto.setSm_addr1(rs.getString("sm_addr1"));
				smdto.setSm_addr2(rs.getString("sm_addr2"));
				smdto.setSm_addr2(rs.getString("sm_addr3"));
				smdto.setSm_stat_cd(rs.getString("sm_stat_cd"));
				smdto.setMgr_auth_cd(rs.getString("mgr_auth_cd"));
				smdto.setSm_remark(rs.getString("sm_remark"));
				smdto.setSm_time(rs.getString("sm_time"));
				smdto.setSm_remark(rs.getString("sm_rest"));
				list.add(smdto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// 2. 판매회원 등록    smInsert()
	public int smInsert(smDTO dto) {
		int n = 0;
		String sql = "insert into sales_member(sm_id, shop_name, sm_pw, sm_name, sm_tell, business_no, sm_date, sm_post, sm_addr1, sm_addr2, sm_addr3, sm_stat_cd, mgr_auth_cd, sm_remark, sm_time, sm_rest)"
				+ "values(?, ?, ?, ?, ?, ?, sysdate, ?, ?, ?, ?, 'ACT01', 'M02', ?, ?, ?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getSm_id());
			psmt.setString(2, dto.getShop_name());
			psmt.setString(3, dto.getSm_pw());
			psmt.setString(4, dto.getSm_name());
			psmt.setString(5, dto.getSm_tell());
			psmt.setString(6, dto.getBusiness_no());
			psmt.setString(7, dto.getSm_post());
			psmt.setString(8, dto.getSm_addr1());
			psmt.setString(9, dto.getSm_addr2());
			psmt.setString(10, dto.getSm_addr3());
			psmt.setString(11, dto.getSm_remark());
			psmt.setString(12, dto.getSm_time());
			psmt.setString(13, dto.getSm_rest());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}

	// 3. 판매회원 수정    smUpdate()
	public int smUpdate(smDTO smDTO, String smId) {
		int p = 0;
		try {
			String sql = "update sales_member set sm_pw=?, sm_name=?, shop_name=?, sm_tell=?, business_no=?, "
					+ " sm_post=?, sm_addr1=?, sm_addr2=?, sm_addr3=?, sm_remark=?, sm_time=?, sm_rest=? where sm_id=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, smDTO.getSm_pw());
			psmt.setString(2, smDTO.getSm_name());
			psmt.setString(3, smDTO.getShop_name());
			psmt.setString(4, smDTO.getSm_tell());
			psmt.setString(5, smDTO.getBusiness_no());
			psmt.setString(6, smDTO.getSm_post());
			psmt.setString(7, smDTO.getSm_addr1());
			psmt.setString(8, smDTO.getSm_addr2());
			psmt.setString(9, smDTO.getSm_addr3());
			psmt.setString(10, smDTO.getSm_remark());
			psmt.setString(11, smDTO.getSm_time());
			psmt.setString(12, smDTO.getSm_rest());
			psmt.setString(13, smId);
			p = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return p;
	}

	//4. 판매회원 삭제    smDelete()
	public int smDelete(smDTO smDTO) {
		int p = 0;
		try {
			String sql = "delete from sales_member where sm_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, smDTO.getSm_id());
			p = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return p;
	}
	
	public smDTO smSelectOne(String smid) {		//판매회원 단건조회
		smDTO smdto = new smDTO();
		
		String sql = "select * from sales_member where sm_id=?";
		String sql1="select img_name, i.img_no from image i join image_detail d on i.img_no=d.img_no where section='I01' and section_no=?";
		
		PreparedStatement psmt1;
		ResultSet rs1;
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, smid);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				smdto.setSm_id(rs.getString("sm_id"));
				smdto.setShop_name(rs.getString("shop_name"));
				smdto.setSm_pw(rs.getString("sm_pw"));
				smdto.setSm_name(rs.getString("sm_name"));
				smdto.setSm_tell(rs.getString("sm_tell"));
				smdto.setBusiness_no(rs.getString("business_no"));
				smdto.setSm_date(rs.getDate("sm_date"));
				smdto.setSm_post(rs.getString("sm_post"));
				smdto.setSm_addr1(rs.getString("sm_addr1"));
				smdto.setSm_addr2(rs.getString("sm_addr2"));
				smdto.setSm_addr3(rs.getString("sm_addr3"));
				smdto.setSm_stat_cd(rs.getString("sm_stat_cd"));
				smdto.setMgr_auth_cd(rs.getString("mgr_auth_cd"));
				smdto.setSm_remark(rs.getString("sm_remark"));
				smdto.setSm_time(rs.getString("sm_time"));
				smdto.setSm_rest(rs.getString("sm_rest"));
				
				psmt1=conn.prepareStatement(sql1);
				psmt1.setString(1, smid);
				rs1=psmt1.executeQuery();
				List<imageDetailDTO> imgList=new ArrayList<imageDetailDTO>();
				
				while(rs1.next()) {
					imageDetailDTO imgDTO = new imageDetailDTO();
					imgDTO.setImg_name(rs1.getString("img_name"));
					imgDTO.setImg_no(rs1.getInt("img_no"));
					imgList.add(imgDTO);
				}
				smdto.setImg_name(imgList);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return smdto;
	}
	
	public int updateShop(smDTO sdto) {
		int result = 0;
		
		String sql ="update sales_member set "
				+" shop_name = ?, sm_pw=?, sm_name=?, sm_tell=?, sm_post=?, "
				+" sm_addr1=?, sm_addr2=?, sm_addr3=?, sm_remark=?, sm_time=?, sm_rest=? where sm_id=?";
		
		//shopname, pw, name, tell, post, addr123,remark, time, rest, id
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, sdto.getShop_name());
			psmt.setString(2, sdto.getSm_pw());
			psmt.setString(3, sdto.getSm_name());
			psmt.setString(4, sdto.getSm_tell());
			psmt.setString(5, sdto.getSm_post());
			psmt.setString(6, sdto.getSm_addr1());
			psmt.setString(7, sdto.getSm_addr2());
			psmt.setString(8, sdto.getSm_addr3());
			psmt.setString(9, sdto.getSm_remark());
			psmt.setString(10, sdto.getSm_time());
			psmt.setString(11, sdto.getSm_rest());
			psmt.setString(12, sdto.getSm_id());
			
			result = psmt.executeUpdate();
			System.out.println("상점 정보가 "+result+"건 변경되었습니다.");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	}
	
	//판매회원 등록창에서 아이디 중복체크
	public boolean IdOverlap(String id) {
		boolean bol = true;
		String sql = "select sm_id from sales_member where sm_id = ? ";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if (rs.next()) {
				if (rs.getString("sm_id") == null || rs.getString("sm_id") == "") {
					bol = true;
				} else {
					bol = false;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return bol;
	}
	
}
