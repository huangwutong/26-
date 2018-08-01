package test.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import test.util.DbConnectionService;
import test.vo.AdminInfo;

public class AdminServiceImpl implements IAdminService {

	private Connection connection;
	private Statement statement;
	private ResultSet resultSet;

	public AdminServiceImpl() {
		connection = DbConnectionService.getConnection();
		try {
			statement = connection.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<AdminInfo> getAdmin(AdminInfo adminInfo) {

		String sql = "select * from admininfo where admin_name='"
				+ adminInfo.getAdmin_name() + "' and admin_password='"
				+ adminInfo.getAdmin_password() + "'";
		
		List<AdminInfo> list = new ArrayList<AdminInfo>();

		try {
			resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {
				list.add(new AdminInfo(resultSet.getInt(1), resultSet
						.getString(2), resultSet.getString(3)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
