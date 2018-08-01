package crm.sales.b;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.cls.Replace;
import sys.dao.ConnectManager;
import sys.dao.bean.Personnel;


public class AddNarrate extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	//添加公司说明
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		Integer compageid = Integer.valueOf(Replace.pep(request.getParameter("companyid")));
		Personnel user = (Personnel)request.getSession().getAttribute("user");
		String sql = "update company set companynarrate = companynarrate + '<br/>["+request.getSession().getAttribute("date")+"]:"+Replace.pep(request.getParameter("narrate"))+"--"+user.getRealname()+"-"+user.getDept().getDeptname()+"' where companyid = "+compageid;
		ConnectManager cm = ConnectManager.newInstance();
		RequestDispatcher rd=null;
		if (cm.getConnection())
		{
			try
			{
				cm.executeUpdate(sql);
				request.setAttribute("success", "公司简介添加成功!<a href='infoB?companyid="+compageid+"' class='pagenum' >返回</a>");
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
