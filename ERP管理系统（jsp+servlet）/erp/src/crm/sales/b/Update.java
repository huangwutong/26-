package crm.sales.b;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.cls.Replace;
import sys.dao.ConnectManager;

@SuppressWarnings("serial")
public class Update extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String id = request.getParameter("id");
		String nameParticular = Replace.pep(request.getParameter("nameParticular"));
		String companyAddress = Replace.pep(request.getParameter("companyAddress"));
		String neturl = Replace.pep(request.getParameter("neturl"));
		String district = Replace.pep(request.getParameter("district"));
		String industry = Replace.pep(request.getParameter("industry"));
		String companyNarrate = Replace.pep(request.getParameter("companyNarrate"));
		ConnectManager cm = ConnectManager.newInstance();
		RequestDispatcher rd = request.getRequestDispatcher("/infoB?companyid="+id+"&size="+request.getParameter("size"));
		if (cm.getConnection())
		{
			try
			{
				String sql = "update company set nameparticular='"+nameParticular+"',companyaddress='"+companyAddress+"'," +
				"neturl='"+neturl+"',districtid="+district+",industryid="+industry+",companynarrate='"+companyNarrate+"'" +
						" where companyid = "+id;
				cm.executeUpdate(sql);
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
