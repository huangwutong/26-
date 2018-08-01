package crm.sales.add;

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


public class Chick extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	//检查A库中的客户
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		ConnectManager cm = ConnectManager.newInstance();
		RequestDispatcher rd = null;
		if (cm.getConnection())
		{
			Personnel user = (Personnel)request.getSession().getAttribute("user");
			String sql = "select count(*) from company where companystate ='A' and personnelid = "+user.getPersonnelid();
			ResultSet rs = cm.executeQuery(sql);
			try
			{
				if (rs.next())
				{
					int i = rs.getInt(1);
					i = user.getA() - i;
					if (i>0)
					{
						rd = request.getRequestDispatcher("crm/add/keyword.jsp");
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
			rd.forward(request, response);
		}
	}
}
