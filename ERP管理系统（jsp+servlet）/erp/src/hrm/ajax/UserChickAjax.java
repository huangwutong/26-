package hrm.ajax;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.dao.ConnectManager;

@SuppressWarnings("serial")
public class UserChickAjax extends HttpServlet
{

	@SuppressWarnings("unchecked")
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		String jobId = request.getParameter("jobId");
		String sql = "select * from personnel where jobid = '" + jobId + "'";
		ConnectManager cm = ConnectManager.newInstance();
		if (cm.getConnection())
		{
			ResultSet rs = cm.executeQuery(sql);
			try
			{
				if (rs.next())
				{
					response.getWriter().print("这个工号已存在");
				}
				rs.close();
			}
			catch (SQLException e)
			{
				e.printStackTrace();
			}
			finally
			{
				cm.close();
			}
		}
		else
		{
			response.getWriter().print("系统出错");
		}
	}
}
