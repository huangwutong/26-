package ad.op;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.cls.Replace;
import sys.dao.ConnectManager;

@SuppressWarnings("serial")
public class UpdateBill extends HttpServlet
{

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		RequestDispatcher rd = request.getRequestDispatcher("/succ.jsp");
		String billid = request.getParameter("id");
		String sortid = request.getParameter("sort");
		String billno = Replace.pep(request.getParameter("billNo"));
		String billtype = Replace.pep(request.getParameter("billType"));
		String billprice = Replace.pep(request.getParameter("billPrice"));
		String billremark = Replace.pep(request.getParameter("billRemark"));
		String sql = "update bill set sortid = "+sortid+",billno = '"+ billno+"',billtype = "+billtype+",billprice = " +
		billprice+",billremark='"+billremark+"' where billid = "+billid;
		if (!"".equals(sortid)&&!"".equals(billno)&&!"".equals(billtype)&&!"".equals(billprice)&&!"".equals(billremark))
		{
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					cm.executeUpdate(sql);
					request.setAttribute("success", "修改成功了");
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
