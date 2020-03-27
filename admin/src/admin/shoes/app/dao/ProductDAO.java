package admin.shoes.app.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import admin.shoes.app.dto.imageDetailDTO;
import admin.shoes.app.dto.pdtDTO;

public class ProductDAO extends DAO {

	public int insertProduct(pdtDTO pdto) {
		int result = 0;

		String sql = "insert into product values((select max(pdt_no)+1 from product), ?,?,?,?,?,?,'I',sysdate,? )";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pdto.getPdt_name());
			psmt.setString(2, pdto.getSm_id());
			psmt.setString(3, pdto.getPdt_type_cd());
			psmt.setString(4, pdto.getPdt_kind_cd());
			psmt.setString(5, pdto.getGender_cd());
			psmt.setInt(6, pdto.getPdt_price());
			psmt.setString(7, pdto.getPdt_remark());

			result = psmt.executeUpdate();
			System.out.println("제품 " + result + " 건 등록되었습니다.");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return result;
	}

	public List<pdtDTO> productList(String smid) {
		List<pdtDTO> list = new ArrayList<pdtDTO>();

		String sql = "select * from product p left outer join opt o on p.pdt_no=o.pdt_no where sm_id=?";
		String sql1 = "select img_name from image i join image_detail d on i.img_no=d.img_no where section='I02' and section_no=?";
		String sql2 = "select code_name from code where code_id=?";

		PreparedStatement psmt1;
		ResultSet rs1;

		PreparedStatement psmt2;
		ResultSet rs2;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, smid);

			rs = psmt.executeQuery();

			while (rs.next()) {

				pdtDTO pdto = new pdtDTO();
				pdto.setPdt_no(rs.getInt("pdt_no"));
				pdto.setPdt_name(rs.getString("pdt_name"));
				pdto.setSm_id(rs.getString("sm_id"));
				pdto.setPdt_type_cd(rs.getString("pdt_type_cd"));
				pdto.setPdt_kind_cd(rs.getString("pdt_kind_cd"));
				pdto.setGender_cd(rs.getString("gender_cd"));
				pdto.setPdt_price(rs.getInt("pdt_price"));
				pdto.setPdt_stat_cd(rs.getString("pdt_stat_cd"));
				pdto.setPdt_date(rs.getDate("pdt_date"));
				pdto.setPdt_remark(rs.getString("pdt_remark"));
				pdto.setPdt_size_cd(rs.getInt("pdt_size_cd"));
				//pdto.setPdt_color_cd(rs.getString("pdt_color_cd"));
				String temp=rs.getString("pdt_color_cd");
				if(temp!=null) {
					String[] color=temp.split(",");
					String[] colorname=new String[color.length];
					for(int i=0; i<color.length; i++) {
						CodeDAO cdao = new CodeDAO();
						colorname[i]=cdao.CodeidToCodename(color[i]);	
					}
					String cname=StringUtils.join(colorname, ',');
					pdto.setPdt_color_cd(cname);
				}else {
					pdto.setPdt_color_cd(rs.getString("pdt_color_cd"));
				}
				

				psmt1 = conn.prepareStatement(sql1);
				psmt1.setInt(1, rs.getInt("pdt_no"));
				rs1 = psmt1.executeQuery();

				List<imageDetailDTO> imglist = new ArrayList<imageDetailDTO>();
				while (rs1.next()) {
					imageDetailDTO iddto = new imageDetailDTO();
					iddto.setImg_name(rs1.getString("img_name"));
					imglist.add(iddto);
				}
				pdto.setImg_name(imglist);

				psmt2 = conn.prepareStatement(sql2);
				psmt2.setString(1, rs.getString("pdt_kind_cd"));
				rs2 = psmt2.executeQuery();
				if (rs2.next()) {
					pdto.setPdt_kind_name(rs2.getString("code_name"));
				}
				list.add(pdto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public int deleteProduct(int pdtno) {
		int result=0;
		
		String sql ="delete from product where pdt_no=?";
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, pdtno);
			
			result=psmt.executeUpdate();
			
			System.out.println("제품 "+result+"건 삭제되었습니다.");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		
		return result;
	}
	
	public int pdtno(String pdtname) {
		int result = 0;
		
		String sql = "select pdt_no from product where pdt_name=?";
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, pdtname);
			
			rs=psmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt("pdt_no");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		
		return result;
	}

}
