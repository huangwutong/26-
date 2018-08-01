package ad.op;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.dao.ConnectManager;
import sys.dao.bean.Personnel;

@SuppressWarnings("serial")
public class Destine extends HttpServlet
{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String billid = request.getParameter("billid");
		String companyid = request.getParameter("companyid");
		Personnel personnel = (Personnel)request.getSession().getAttribute("user");
		String destime = request.getParameter("destime");
		ConnectManager cm = ConnectManager.newInstance();
		RequestDispatcher rd = request.getRequestDispatcher("ad/select/info.jsp");
		if (cm.getConnection())
		{
			String sql = "update bill set billstate='B' where billid = " + billid;
			cm.executeUpdate(sql);
			sql= "insert into destinenote values("+billid+","+companyid+","+personnel.getPersonnelid()+",'"+
			new java.text.SimpleDateFormat("yy-MM-dd").format(new java.util.Date()).toString()+"',null,"+destime+",null,null,null)";
			cm.executeUpdate(sql);
		}
		request.setAttribute("success", "预定成功");
		rd.forward(request, response);
	}

}
