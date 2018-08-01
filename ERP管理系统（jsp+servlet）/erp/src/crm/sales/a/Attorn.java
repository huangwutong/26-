package crm.sales.a;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.dao.ConnectManager;


public class Attorn extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	//转让自己的客户
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String pid = request.getParameter("personnel").replace(" ", "");
		String ids = request.getParameter("cleintids").replace(" ", "");
		String sql = "";
		ConnectManager cm = ConnectManager.newInstance();
		RequestDispatcher rd=null;
		if (cm.getConnection())
		{
			ResultSet rs;
			try
			{
				if (ids.length() > 1)
				{
					sql = "select companyid from company where companyid in ("+ids+")";
					rs = cm.executeQuery(sql);
					List<String> strs = new ArrayList<String>();
					while (rs.next())
					{
						strs.add(rs.getString("companyid"));
					}
					for (String temp:strs)
					{
						sql = "select * from company where companyid = " + temp + " and indate!=adddate and (dateadd(dd,30,(indate))>'" + new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) + "')";
						rs = cm.executeQuery(sql);
						if (rs.next())
						{
							request.setAttribute("error", "得到一个客户后,要在30天后才可以转让");
							rd = request.getRequestDispatcher("/error.jsp");
						}
						else
						{
							sql = "update company set accepterid = "+pid+ " where companyid = "+temp;
							cm.executeUpdate(sql);
							request.setAttribute("success", "转让成功，正在等待对方接收<a href='selectA' class='pagenum' >返回</a>");
							rd = request.getRequestDispatcher("/succ.jsp");
						}
					}
				}
				else
				{
					sql = "select * from company where companyid = " + ids + " and indate!=adddate and (dateadd(dd,30,(indate))>'" + new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) + "')";
					rs = cm.executeQuery(sql);
					if (rs.next())
					{
						request.setAttribute("error", "得到一个客户后,要在30天后才可以转让");
						rd = request.getRequestDispatcher("/error.jsp");
					}
					else
					{
						sql = "update company set accepterid = "+pid+ " where companyid = "+ids;
						cm.executeUpdate(sql);
						request.setAttribute("success", "转让成功，正在等待对方接收<a href='selectA' class='pagenum' >返回</a>");
						rd = request.getRequestDispatcher("/succ.jsp");
					}
				}
			}
			catch (SQLException e1)
			{
				e1.printStackTrace();
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
