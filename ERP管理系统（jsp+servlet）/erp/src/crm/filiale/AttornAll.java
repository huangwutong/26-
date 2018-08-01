package crm.filiale;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.dao.ConnectManager;


public class AttornAll extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	//总经理对业务员的客户进行转让，总经理可以进行跨部门口转让
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String pid = request.getParameter("personnel").replace(" ", "");
		String ids = request.getParameter("oldpersonnel").replace(" ", "");
		String sql = "update company set accepterid = "+pid+ " where personnelid = " + ids;
		ConnectManager cm = ConnectManager.newInstance();
		RequestDispatcher rd=null;
		if (cm.getConnection())
		{
			try
			{
				cm.executeUpdate(sql);
				request.setAttribute("success", "转让成功，正在等待对方接收<a href='fCompany?"+request.getSession().getAttribute("p")+"' class='pagenum' >返回</a>");
				rd = request.getRequestDispatcher("/succ.jsp");
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
