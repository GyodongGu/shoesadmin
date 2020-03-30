package admin.shoes.app.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

public class DAO {
	protected Connection conn;
	protected PreparedStatement psmt;
	protected ResultSet rs;
	protected DataSource ds;
	
	
	 private String driver = "oracle.jdbc.driver.OracleDriver"; 
	 private String url= "jdbc:oracle:thin:@localhost:1521:xe"; 
	 private String user = "you";
	 private String pw = "you";
	 
	
	/*
	 * private String driver = "com.mysql.jdbc.Driver"; private String url =
	 * "jdbc:mysql://shoesdb.crrif2a5kpo3.ap-northeast-2.rds.amazonaws.com/youshoes";
	 * private String user = "admin"; private String pw = "youshoesdb";
	 */
	
	public DAO() {
		try {
			Class.forName(driver);
			conn=DriverManager.getConnection(url, user, pw);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if(rs != null) {
				rs.close();
			}
			if(psmt != null) {
				psmt.close();
			}
			if(conn != null) {
				conn.close();
			}
			
		}catch(SQLException e) {
			
		}
		
	}
	
}
