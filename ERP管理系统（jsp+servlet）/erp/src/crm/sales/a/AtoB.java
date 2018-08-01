package crm.sales.a;

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


public class AtoB extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	//A库客户转让B库
	public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		ConnectManager cm = ConnectManager.newInstance();
		RequestDispatcher rd = null;
		if (cm.getConnection())
		{
			Personnel user = (Personnel)request.getSession().getAttribute("user");
			String sql = "select count(*) from company where companystate ='B' and personnelid = "+user.getPersonnelid();
			ResultSet rs = cm.executeQuery(sql);
			try
			{
				if (rs.next())
				{
					int i = rs.getInt(1);
					i = user.getB() - i;
					String id = request.getParameter("cleintids");
					int j = Integer.valueOf(request.getParameter("i"));
					if (i>(j/2+1))
					{
						sql = "update company set companystate = 'B',companytype='C',accepterid=null where companyid in ("+id+")";
						cm.executeUpdate(sql);
						request.setAttribute("success", "转B库已成功<a href='selectA' class='pagenum' >返回</a>");
						rd = request.getRequestDispatcher("/succ.jsp");
					}
					else
					{
						request.setAttribute("error", "你的B库客户已满，请清理B库客户");
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
