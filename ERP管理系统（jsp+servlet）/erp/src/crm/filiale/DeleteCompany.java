package crm.filiale;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.dao.ConnectManager;

public class DeleteCompany extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// 从数据库中删除客户数据，会先删除拜访记录，然后是联系人记录，最后是公司记录
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String ids = request.getParameter("cleintids").replace(" ", "");
		ConnectManager cm = ConnectManager.newInstance();
		RequestDispatcher rd = request.getRequestDispatcher("/succ.jsp");
		if (cm.getConnection())
		{
			try
			{
				String sql = "";
				if (request.getParameter("toc") != null)
				{
					sql = "update company set lastPersonnel = personnelid,personnelid=null,companystate = 'C',companytype='A',accepterid=null,indate=null where companyid in ("+ids+")";
					cm.executeUpdate(sql);
					request.setAttribute("success", "客户已转C库成功!<a href='fCompany?" + request.getSession().getAttribute("p") + "' class='pagenum' >返回</a>");
				}
				else
				{
					sql = "delete visit where companyid in (" + ids + ")";
					cm.executeUpdate(sql);
					sql = "delete linkman where companyid in (" + ids + ")";
					cm.executeUpdate(sql);
					sql = "delete company where companyid in (" + ids + ")";
					cm.executeUpdate(sql);
					if (request.getParameter("i") == null)
					{
						request.setAttribute("success", "客户已删除成功!<a href='fCompany?" + request.getSession().getAttribute("p") + "' class='pagenum' >返回</a>");
					}
					else if (request.getParameter("s") == null)
					{
						request.setAttribute("success", "客户已删除成功!<a href='fcList' class='pagenum' >返回</a>");
					}
					else
					{
						request.setAttribute("success", "客户已删除成功!<a href='fscarchc?" + request.getSession().getAttribute("p") + "' class='pagenum' >返回</a>");
					}
				}
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
