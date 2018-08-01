package hrm.update;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.dao.ConnectManager;


public class Pass extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	//员工转正
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String sql = "update personnel set passdate = '"+Date.valueOf(DateFormat.getDateInstance(DateFormat.DEFAULT).format(new java.util.Date()))+"' where personnelid in ("+request.getParameter("cleintids")+")";
		ConnectManager cm = ConnectManager.newInstance();
		request.setAttribute("page", request.getParameter("size"));
		if (cm.getConnection())
		{
			try
			{
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
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
		request.getRequestDispatcher("selectPersonnel?page="+request.getAttribute("page")).forward(request, response);
	}
}
