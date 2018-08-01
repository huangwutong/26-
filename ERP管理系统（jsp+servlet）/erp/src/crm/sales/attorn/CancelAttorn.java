package crm.sales.attorn;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.dao.ConnectManager;

public class CancelAttorn extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	//取消转让
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		ConnectManager cm = ConnectManager.newInstance();
		RequestDispatcher rd = request.getRequestDispatcher("/succ.jsp");
		if (cm.getConnection())
		{
			try
			{
				String sql = "update company set accepterid = null where companyid in (" + request.getParameter("cleintids") +")";
				cm.executeUpdate(sql);
				request.setAttribute("success","已经取消这次转让");
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
