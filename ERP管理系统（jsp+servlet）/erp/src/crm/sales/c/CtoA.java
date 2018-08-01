package crm.sales.c;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.dao.ConnectManager;
import sys.dao.bean.Personnel;

public class CtoA extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// 把客户加入到A库中
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		ConnectManager cm = ConnectManager.newInstance();
		RequestDispatcher rd = request.getRequestDispatcher("/succ.jsp");
		if (cm.getConnection())
		{
			try
			{
				Personnel user = (Personnel) request.getSession().getAttribute("user");
				String sql = "select count(*) from company where companystate ='A' and personnelid = " + user.getPersonnelid();
				ResultSet rs = cm.executeQuery(sql);
				if (rs.next())
				{
					int i = rs.getInt(1);
					i = user.getA() - i;
					String id = request.getParameter("cleintids");
					int j = Integer.valueOf(request.getParameter("i"));
					if (i > (j / 2 + 1))
					{
						rs.close();
						if (id.length() > 1)
						{
							sql = "select companyid from company where companyid in ("+id+")";
							rs = cm.executeQuery(sql);
							List<String> strs = new ArrayList<String>();
							while (rs.next())
							{
								strs.add(rs.getString("companyid"));
							}
							for (String temp:strs)
							{
								rs.close();
								sql = "select * from company where companyid = " + temp + " and lastPersonnel=" + user.getPersonnelid() + " and " + "(dateadd(dd,30,(select visittime from visit where visitid =(select max(visitid) from visit where visittype = 'D' and companyid = " + temp + ")))>'" + new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) + "')";
								rs = cm.executeQuery(sql);
								if (rs.next())
								{
									request.setAttribute("error", "删除一个客户后,要在30天后才可以从公共库拿回");
									rd = request.getRequestDispatcher("/error.jsp");
									break;
								}
								else
								{
									sql = "update company set companystate = 'A',companytype='B',personnelid=" + user.getPersonnelid() + ",indate='" + new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) + "',accepterid=null where companyid in (" + id + ")";
									cm.executeUpdate(sql);
									if (request.getParameter("s") != null)
									{
										request.setAttribute("success", "客户收藏成功<a href='clear?search=c' class='pagenum' >返回</a>");
									}
									else
									{
										request.setAttribute("success", "客户收藏成功<a href='selectC' class='pagenum' >返回</a>");
									}
								}
							}
						}
						else
						{
							sql = "select * from company where companyid = " + id + " and lastPersonnel=" + user.getPersonnelid() + " and " + "(dateadd(dd,30,(select visittime from visit where visitid =(select max(visitid) from visit where visittype = 'D' and companyid = " + id + ")))>'" + new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) + "')";
							rs = cm.executeQuery(sql);
							if (rs.next())
							{
								request.setAttribute("error", "删除一个客户后,要在30天后才可以从公共库拿回");
								rd = request.getRequestDispatcher("/error.jsp");
							}
							else
							{
								sql = "update company set companystate = 'A',companytype='B',personnelid=" + user.getPersonnelid() + ",indate='" + new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) + "',accepterid=null where companyid = " + id;
								cm.executeUpdate(sql);
								if (request.getParameter("s") != null)
								{
									request.setAttribute("success", "客户收藏成功<a href='clear?search=c' class='pagenum' >返回</a>");
								}
								else
								{
									request.setAttribute("success", "客户收藏成功<a href='selectC' class='pagenum' >返回</a>");
								}
							}
						}
					}
					else
					{
						request.setAttribute("error", "你的A库客户已满，请清理A库客户");
						rd = request.getRequestDispatcher("/error.jsp");
					}
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
			request.setAttribute("error", "系统故障，请重试或联系管理员");
			rd = request.getRequestDispatcher("/error.jsp");
		}
		rd.forward(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		ConnectManager cm = ConnectManager.newInstance();
		RequestDispatcher rd = request.getRequestDispatcher("/succ.jsp");
		Calendar date = Calendar.getInstance();
		date.setTime(new java.util.Date());
		if (cm.getConnection())
		{
			try
			{
				Personnel user = (Personnel) request.getSession().getAttribute("user");
				String sql = "select count(*) from company where companystate ='A' and personnelid = " + user.getPersonnelid();
				ResultSet rs = cm.executeQuery(sql);
				if (rs.next())
				{
					int i = rs.getInt(1);
					i = user.getA() - i;
					String id = request.getParameter("cleintids");
					int j = Integer.valueOf(request.getParameter("i"));
					if (i > (j / 2 + 1))
					{
						rs.close();
						if (id.length() > 1)
						{
							sql = "select companyid from company where companyid in ("+id+")";
							rs = cm.executeQuery(sql);
							List<String> strs = new ArrayList<String>();
							while (rs.next())
							{
								strs.add(rs.getString("companyid"));
							}
							for (String temp:strs)
							{
								rs.close();
								sql = "select * from company where companyid = " + temp + " and lastPersonnel=" + user.getPersonnelid() + " and " + "(dateadd(dd,30,(select visittime from visit where visitid =(select max(visitid) from visit where visittype = 'D' and companyid = " + temp + ")))>'" + new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) + "')";
								rs = cm.executeQuery(sql);
								if (rs.next())
								{
									request.setAttribute("error", "删除一个客户后,要在30天后才可以从公共库拿回");
									rd = request.getRequestDispatcher("/error.jsp");
									break;
								}
								else
								{
									sql = "update company set companystate = 'A',companytype='B',personnelid=" + user.getPersonnelid() + ",indate='" + new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) + "',accepterid=null where companyid in (" + id + ")";
									cm.executeUpdate(sql);
									if (request.getParameter("s") != null)
									{
										request.setAttribute("success", "客户收藏成功<a href='clear?search=c' class='pagenum' >返回</a>");
									}
									else
									{
										request.setAttribute("success", "客户收藏成功<a href='selectC' class='pagenum' >返回</a>");
									}
								}
							}
						}
						else
						{
							sql = "select * from company where companyid = " + id + " and lastPersonnel=" + user.getPersonnelid() + " and " + "(dateadd(dd,30,(select visittime from visit where visitid =(select max(visitid) from visit where visittype = 'D' and companyid = " + id + ")))>'" + new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) + "')";
							rs = cm.executeQuery(sql);
							if (rs.next())
							{
								request.setAttribute("error", "删除一个客户后,要在30天后才可以从公共库拿回");
								rd = request.getRequestDispatcher("/error.jsp");
							}
							else
							{
								sql = "update company set companystate = 'A',companytype='B',personnelid=" + user.getPersonnelid() + ",indate='" + new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) + "',accepterid=null where companyid = " + id;
								cm.executeUpdate(sql);
								if (request.getParameter("s") != null)
								{
									request.setAttribute("success", "客户收藏成功<a href='clear?search=c' class='pagenum' >返回</a>");
								}
								else
								{
									request.setAttribute("success", "客户收藏成功<a href='selectC' class='pagenum' >返回</a>");
								}
							}
						}
					}
					else
					{
						request.setAttribute("error", "你的A库客户已满，请清理A库客户");
						rd = request.getRequestDispatcher("/error.jsp");
					}
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
			request.setAttribute("error", "系统故障，请重试或联系管理员");
			rd = request.getRequestDispatcher("/error.jsp");
		}
		rd.forward(request, response);
	}
}
