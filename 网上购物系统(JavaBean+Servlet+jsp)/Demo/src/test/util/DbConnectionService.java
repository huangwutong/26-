package test.util;
//数据库整合
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnectionService {
	private static Connection conn;

	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test", "root", "mysql");
		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return conn;
	}

	public DbConnectionService() {
		this.conn = this.getConnection();  //代码的继承

	}
}
