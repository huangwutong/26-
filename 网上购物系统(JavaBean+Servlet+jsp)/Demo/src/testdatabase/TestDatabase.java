package testdatabase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TestDatabase {

	/**
	 * @param args
	 */

	public static void main(String args[]) {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("class forname ok");
			Connection conn;
			try {
				conn = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/test", "root", "mysql");
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("select * from messageboard ");
				while (rs.next())
					System.out.println(rs.getInt(1) + "|" + rs.getString(2)
							+ "|" + rs.getString(3)+"|"+rs.getString(4));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
