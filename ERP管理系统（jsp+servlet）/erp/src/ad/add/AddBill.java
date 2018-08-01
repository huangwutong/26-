package ad.add;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.cls.Replace;
import sys.dao.ConnectManager;

/**
 * Servlet implementation class for Servlet: UploadServlet
 *
 */
@SuppressWarnings("serial")
public class AddBill extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		RequestDispatcher rd = request.getRequestDispatcher("/succ.jsp");
		String sortid = request.getParameter("sort");
		String billno = Replace.pep(request.getParameter("billNo"));
		String billtype = Replace.pep(request.getParameter("billType"));
		String billprice = Replace.pep(request.getParameter("billPrice"));
		String billremark = Replace.pep(request.getParameter("billRemark"));
		if (!"".equals(sortid)&&!"".equals(billno)&&!"".equals(billtype)&&!"".equals(billprice)&&!"".equals(billremark))
		{
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					String sql = "insert into bill values("+sortid+",'"+billno+"',"+billtype+",";
					sql = sql + billprice +",'A',null,null,'"+billremark+"',null,null)";
					cm.executeUpdate(sql);
					request.setAttribute("success", "添加成功了");
				}
				finally
				{
					cm.close();
				}
			}
			else
			{
				request.setAttribute("error", "添加广告位出错,系统问题请联系管理员");
				rd = request.getRequestDispatcher("/error.jsp");
			}
		}
		else
		{
			request.setAttribute("error", "添加广告位出错,你没填入正确的数据");
			rd = request.getRequestDispatcher("/error.jsp");
		}
		rd.forward(request, response);
	}
	
}
