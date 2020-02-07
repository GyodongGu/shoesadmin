/**
 * 
 */
package admin.shoes.app.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;

/**
 * @author reki 작성일자 : 2019-11-07 상위 Dao 객체
 *
 */
public class DAO {
	protected Connection conn;
	protected PreparedStatement psmt;
	protected ResultSet rs;
	protected DataSource ds;

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "hr";
	private String passwd = "hr";
	

	public DAO() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, passwd); // 드라이버를 찾지못하면 클래스낫파운드익셉션이 뜸
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
//			try {
//			Context initContext = new InitialContext();
//			Context envContext = (Context) initContext.lookup("java:/comp/env");
//			ds = (DataSource)envContext.lookup("jdbc/myoracle");
//			conn = ds.getConnection();
//			}catch (NamingException | SQLException e) {
//				e.printStackTrace();
//			}
//	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
