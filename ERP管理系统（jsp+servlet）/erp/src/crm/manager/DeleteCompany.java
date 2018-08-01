package crm.manager;

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

	//把本部门的员工的客户转到公共库
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String ids = request.getParameter("cleintids").replace(" ", "");
		String sql = "update company set lastPersonnel = personnelid,personnelid=null,companystate = 'C',companytype='A',accepterid=null,indate=null where companyid in ("+ids+")";
		ConnectManager cm = ConnectManager.newInstance();
		RequestDispatcher rd=request.getRequestDispatcher("/succ.jsp");
		if (cm.getConnection())
		{
			try
			{
				cm.executeUpdate(sql);
				request.setAttribute("success", "客户已转入公共库成功!<a href='mCompany' class='pagenum' >返回</a>");
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
