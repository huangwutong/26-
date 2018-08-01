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
import sys.dao.bean.Personnel;

public class DeleteCompany extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// 把自己客户放入公共库
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String ids = request.getParameter("cleintids").replace(" ", "");
		String log = request.getParameter("delectSake").replace(" ", "");
		String sql = "";
		ConnectManager cm = ConnectManager.newInstance();
		RequestDispatcher rd = request.getRequestDispatcher("/succ.jsp");
		ResultSet rs;
		if (cm.getConnection())
		{
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
							request.setAttribute("error", "得到一个客户后,要在30天后才可以删除");
							rd = request.getRequestDispatcher("/error.jsp");
							break;
						}
						else
						{
							sql = "update company set lastPersonnel = personnelid,personnelid=null,companystate = 'C',companytype='A',accepterid=null,indate=null where companyid in (" + ids + ")";
							cm.executeUpdate(sql);
							sql = "select companyid from company where companyid in (" + ids + ")";
							rs = cm.executeQuery(sql);
							List<Integer> list = new ArrayList<Integer>();
							Personnel user = (Personnel) request.getSession().getAttribute("user");
							while (rs.next())
							{
								list.add(rs.getInt("companyid"));
							}
							for (Integer inte : list)
							{
								sql = "insert into visit (visittype,visittime,personnelid,companyid,visitlog) " + "values ('D','" + new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) + "'," + user.getPersonnelid() + "," + inte + ",'" + log + "')";
								cm.executeUpdate(sql);
							}
							request.setAttribute("success", "客户已删除成功!<a href='selectA' class='pagenum' >返回</a>");
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
						request.setAttribute("error", "得到一个客户后,要在30天后才可以删除");
						rd = request.getRequestDispatcher("/error.jsp");
					}
					else
					{
						sql = "update company set lastPersonnel = personnelid,personnelid=null,companystate = 'C',companytype='A',accepterid=null,indate=null where companyid in (" + ids + ")";
						cm.executeUpdate(sql);
						sql = "select companyid from company where companyid in (" + ids + ")";
						rs = cm.executeQuery(sql);
						List<Integer> list = new ArrayList<Integer>();
						Personnel user = (Personnel) request.getSession().getAttribute("user");
						while (rs.next())
						{
							list.add(rs.getInt("companyid"));
						}
						for (Integer inte : list)
						{
							sql = "insert into visit (visittype,visittime,personnelid,companyid,visitlog) " + "values ('D','" + new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) + "'," + user.getPersonnelid() + "," + inte + ",'" + log + "')";
							cm.executeUpdate(sql);
						}
						request.setAttribute("success", "客户已删除成功!<a href='selectA' class='pagenum' >返回</a>");
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
