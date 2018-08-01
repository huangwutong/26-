package test.service;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import test.util.DbConnectionService;
import test.vo.CatagoryInfo;
import test.vo.MessageInfo;

public class MessageBoardServiceImpl implements IMessageBoardService {

	private Connection connection;
	private Statement statement;
	private ResultSet resultSet;

	public MessageBoardServiceImpl() {

		this.connection = DbConnectionService.getConnection();
		try {
			this.statement = this.connection.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<MessageInfo> getMessageInfos() {
		List<MessageInfo> list = new ArrayList<MessageInfo>();
		String sql = "select * from messageboard";
		try {
			resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {

				list.add(new MessageInfo(resultSet.getInt(1), resultSet
						.getString(2), resultSet.getTimestamp(3), resultSet
						.getString(4), resultSet.getString(5)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public MessageInfo saveMessageInfo(MessageInfo boardInfo) {
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

		String sql = "insert into messageboard(message_title,message_date,message_user,message_content) values('"
				+ boardInfo.getMessage_title()
				+ "','"
				+ dateFormat.format(date)
				+ "','"
				+ boardInfo.getMessage_user()
				+ "','" + boardInfo.getMessage_content() + "')";
		//System.out.println(sql);
		try {
			statement.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return boardInfo;
	}

	public List<MessageInfo> getMessageInfos(int currentPage) {

		String sql = "select * from messageboard limit " + (currentPage * 5)
				+ ",5";
		List<MessageInfo> list = new ArrayList<MessageInfo>();

		try {
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				list.add(new MessageInfo(resultSet.getInt(1), resultSet
						.getString(2), resultSet.getDate(3), resultSet
						.getString(4), resultSet.getString(5)));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
