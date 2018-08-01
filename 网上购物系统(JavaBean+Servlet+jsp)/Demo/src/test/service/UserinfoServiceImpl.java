package test.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import test.util.DbConnectionService;
import test.vo.AdminInfo;
import test.vo.Userinfo;

public class UserinfoServiceImpl implements IUserinfoService {

	private Connection connection;
	private Statement statement;
	private ResultSet resultSet;

	public UserinfoServiceImpl() {
		this.connection = DbConnectionService.getConnection();
		try {
			this.statement = this.connection.createStatement();
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	public Userinfo registUserinfo(Userinfo userinfo) {

		String sql = "insert into userinfo(uname,passwd,usex,uinterest,email,address,telephone,city) values('"
				+ userinfo.getUname()
				+ "','"
				+ userinfo.getPasswd()
				+ "','"
				+ userinfo.getUsex()
				+ "','"
				+ userinfo.getUinterest()
				+ "','"
				+ userinfo.getEmail()
				+ "','"
				+ userinfo.getAddress()
				+ "','"
				+ userinfo.getTelephone() + "','" + userinfo.getCity() + "')";
		try {
			this.statement.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userinfo;
	}

	public List<Userinfo> checkUname(String uname) {
		List<Userinfo> list = new ArrayList<Userinfo>();
		String sql = "select * from userinfo where uname='" + uname + "'";
		try {
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				list.add(new Userinfo(resultSet.getInt(1), resultSet
						.getString(2), resultSet.getString(3)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public List<Userinfo> getUserinfo(String uname, String passwd) {
		List<Userinfo> list = new ArrayList<Userinfo>();
		String sql = "select * from userinfo where uname='" + uname
				+ "' and passwd='" + passwd + "'";
		try {
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				list.add(new Userinfo(resultSet.getInt(1), resultSet
						.getString(2), resultSet.getString(3), resultSet
						.getString(4), resultSet.getString(5), resultSet
						.getString(6), resultSet.getString(7), resultSet
						.getString(8), resultSet.getString(9)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
