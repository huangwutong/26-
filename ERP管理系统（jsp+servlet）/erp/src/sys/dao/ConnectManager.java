package sys.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnectManager
{
	private Connection connection = null;
	private Statement statement = null;
	private String time = new SimpleDateFormat("yyyyMMddhhmmss").format(new java.util.Date());

	private ConnectManager()
	{
	}

	public static ConnectManager newInstance()
	{
		return new ConnectManager();
	}

	// 从连接池里得到数据库连接
	public boolean getConnection()
	{
		Context ctx = null;
		DataSource ds = null;
		try
		{
			ctx = new InitialContext();
		}
		catch (NamingException e)
		{
			e.printStackTrace();
			return false;
		}
		try
		{
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/erp");
		}
		catch (NamingException e)
		{
			new Exception(new SimpleDateFormat("yyyy年MM月dd日 HH点mm分ss秒").format(new java.util.Date())+e.getMessage()).printStackTrace();
			return false;
		}
		try
		{
			System.out.println(time+"得到连接池了");
			connection = ds.getConnection();
			statement = connection.createStatement();
		}
		catch (SQLException e)
		{
			new Exception(new SimpleDateFormat("yyyy年MM月dd日 HH点mm分ss秒").format(new java.util.Date())+e.getMessage()).printStackTrace();
			return false;
		}
		return true;
	}

	// 进行SQL更新
	public void executeUpdate(String sqlCommand)
	{
		try
		{
			System.out.println(time+"更新SQL"+sqlCommand);
			statement.executeUpdate(sqlCommand);
		}
		catch (SQLException e)
		{
			new Exception(new SimpleDateFormat("yyyy年MM月dd日 HH点mm分ss秒").format(new java.util.Date())+e.getMessage()+e.getMessage()+sqlCommand).printStackTrace();
		}
	}

	// 进行SQL查询
	public ResultSet executeQuery(String sqlCommand)
	{
		ResultSet resultset = null;
		try
		{
			System.out.println(time+"查询SQL"+sqlCommand);
			resultset = statement.executeQuery(sqlCommand);
		}
		catch (SQLException e)
		{
			new Exception(new SimpleDateFormat("yyyy年MM月dd日 HH点mm分ss秒").format(new java.util.Date())+e.getMessage()+e.getMessage()+sqlCommand).printStackTrace();
		}
		return resultset;
	}

	// 把连接放回到数据源
	public void close()
	{
		try
		{
			System.out.println(time+"放回到连接池了");
			if (statement != null)
			{
				statement.close();
			}
			if (connection != null)
			{
				connection.close();
			}
		}
		catch (SQLException e)
		{
			new Exception(new SimpleDateFormat("yyyy年MM月dd日 HH点mm分ss秒").format(new java.util.Date())+e.getMessage()).printStackTrace();
		}
	}
}
