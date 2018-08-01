package crm.sales.attorn;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.dao.ConnectManager;
import sys.dao.bean.Personnel;

public class Incept extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	//接收客户
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		ConnectManager cm = ConnectManager.newInstance();
		RequestDispatcher rd = request.getRequestDispatcher("/succ.jsp");
		String id = request.getParameter("cleintids");
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		if (cm.getConnection())
		{
			try
			{
				String sql = "";
				ResultSet rs;
				int ccount = 0;
				int icount = 0;
				sql = "select count(*) from company where companystate ='A' and personnelid = " + user.getPersonnelid();
				rs = cm.executeQuery(sql);
				rs.next();
				ccount = rs.getInt(1);
				sql = "select A from personnel where personnelid = " + user.getPersonnelid();
				rs = cm.executeQuery(sql);
				rs.next();
				icount = rs.getInt(1);
				if (icount > ccount)
				{
					sql = "update company set personnelid = accepterid,accepterid = null,companystate='A' where companyid in (" + id + ")";
					cm.executeUpdate(sql);
					request.setAttribute("success", "已经接收");
				}
				else
				{
					request.setAttribute("error", "你的A库客户已满，请清理A库客户");
					rd = request.getRequestDispatcher("/error.jsp");
				}
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
			request.setAttribute("error", "系统故障，请重试或联系管理员");
			rd = request.getRequestDispatcher("/error.jsp");
		}
		rd.forward(request, response);
	}
}
