package crm.manager;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.dao.ConnectManager;
import sys.dao.bean.Personnel;

public class DStatistic extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// 本部门的客户统计
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		ConnectManager cm = ConnectManager.newInstance();
		List<Personnel> users = ((Personnel) request.getSession().getAttribute("user")).getDept().getPersonnels();
		String ids = "";
		List<String> all = new ArrayList<String>();
		List<String> user = new ArrayList<String>();
		for (int i = 0; i < users.size(); i++)
		{
			if (i != users.size() - 1)
			{
				if (users.get(i).getUsername() != null && users.get(i).getOutdate() == null)
				{
					ids = ids + users.get(i).getPersonnelid() + ",";
				}
			}
			else
			{
				if (users.get(i).getUsername() != null && users.get(i).getOutdate() == null)
				{
					ids = ids + users.get(i).getPersonnelid();
				}
				else
				{
					ids = ids.substring(0, ids.length()-1);
				}
			}

		}
		ResultSet rs = null;
		if (cm.getConnection())
		{
			String sql = "select count(*) from company where personnelid in (" + ids + ")";
			rs = cm.executeQuery(sql);
			try
			{
				if (rs.next())
				{
					request.setAttribute("all", "本部门总客户" + rs.getInt(1));
				}
				sql = "select count(*) from company where personnelid in (" + ids + ") and type = 'E'";
				rs = cm.executeQuery(sql);
				if (rs.next())
				{
					all.add("E类客户数:" + rs.getInt(1));
				}
				sql = "select count(*) from company where personnelid in (" + ids + ") and type = 'D'";
				rs = cm.executeQuery(sql);
				if (rs.next())
				{
					all.add("D类客户数:" + rs.getInt(1));
				}
				sql = "select count(*) from company where personnelid in (" + ids + ") and type = 'C'";
				rs = cm.executeQuery(sql);
				if (rs.next())
				{
					all.add("C类客户数:" + rs.getInt(1));
				}
				sql = "select count(*) from company where personnelid in (" + ids + ") and type = 'B'";
				rs = cm.executeQuery(sql);
				if (rs.next())
				{
					all.add("B类客户数:" + rs.getInt(1));
				}
				sql = "select count(*) from company where personnelid in (" + ids + ") and type = 'A'";
				rs = cm.executeQuery(sql);
				if (rs.next())
				{
					all.add("A类客户数:" + rs.getInt(1));
				}
				for (int i = 0; i < users.size(); i++)
				{
					String str = "";
					if (users.get(i).getUsername() != null && users.get(i).getOutdate() == null)
					{
						sql = "select count(*) from company where personnelid = " + users.get(i).getPersonnelid();
						rs = cm.executeQuery(sql);
						if (rs.next())
						{
							str = str + users.get(i).getRealname() + "的总客户数:" + rs.getInt(1) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
						}
						sql = "select count(*) from company where personnelid = " + users.get(i).getPersonnelid() + " and type = 'A'";
						rs = cm.executeQuery(sql);
						if (rs.next())
						{
							str = str + "A类:" + rs.getInt(1) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
						}
						sql = "select count(*) from company where personnelid = " + users.get(i).getPersonnelid() + " and type = 'B'";
						rs = cm.executeQuery(sql);
						if (rs.next())
						{
							str = str + "B类:" + rs.getInt(1) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
						}
						sql = "select count(*) from company where personnelid = " + users.get(i).getPersonnelid() + " and type = 'C'";
						rs = cm.executeQuery(sql);
						if (rs.next())
						{
							str = str + "C类:" + rs.getInt(1) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
						}
						sql = "select count(*) from company where personnelid = " + users.get(i).getPersonnelid() + " and type = 'D'";
						rs = cm.executeQuery(sql);
						if (rs.next())
						{
							str = str + "D类:" + rs.getInt(1) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
						}
						sql = "select count(*) from company where personnelid = " + users.get(i).getPersonnelid() + " and type = 'E'";
						rs = cm.executeQuery(sql);
						if (rs.next())
						{
							str = str + "E类:" + rs.getInt(1);
						}
						user.add(str);
					}
				}
				request.setAttribute("alltype", all);
				request.setAttribute("user", user);
			}
			catch (SQLException e)
			{
				e.printStackTrace();
			}
			finally
			{
				cm.close();
			}
			request.getRequestDispatcher("crm/manager/dstatistic.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("error", "系统故障，请重试或联系管理员");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}
}
