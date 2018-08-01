package hrm.update;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.cls.Replace;
import sys.dao.ConnectManager;


public class UpdatePersonnel extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	//添加员工信息
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String personnelid = request.getParameter("personnelid");
		String page = request.getParameter("page");
		RequestDispatcher rd = request.getRequestDispatcher("/personnelInfo?personnelid="+personnelid+"&size="+page);
		ConnectManager cm = ConnectManager.newInstance();
		if (cm.getConnection())
		{
			try
			{
				String passdate = request.getParameter("passdate");
				if (passdate.equals(""))
				{
					passdate="passdate="+null;
				}
				else
				{
					passdate="passdate='"+passdate+"'";
				}
				String outdate = request.getParameter("outdate");
				if (outdate.equals(""))
				{
					outdate="outdate="+null;
				}
				else
				{
					outdate="outdate='"+outdate+"'";
				}
				String sql = "update personnel set sex="+Replace.pep(request.getParameter("sex"))+",birthday='"+Replace.pep(request.getParameter("birthday"))+
				"',native='"+Replace.pep(request.getParameter("native_"))+"',nation='"+Replace.pep(request.getParameter("nation"))+
				"',polity='"+Replace.pep(request.getParameter("polity"))+"',wedlock="+Replace.pep(request.getParameter("wedlock"))+
				",idcardno='"+Replace.pep(request.getParameter("idCardNo"))+"',idcardaddress='"+Replace.pep(request.getParameter("idCardAddress"))+
				"',socialinsuranceid='"+Replace.pep(request.getParameter("socialinsuranceid"))+"',finishschool='"+Replace.pep(request.getParameter("finishSchool"))+
				"',specialty='"+Replace.pep(request.getParameter("specialty"))+"',academic='"+Replace.pep(request.getParameter("academic"))+
				"',dwelling='"+Replace.pep(request.getParameter("dwelling"))+"',adddate='"+Replace.pep(request.getParameter("adddate"))+
				"',"+passdate+","+outdate+" where personnelid = "+personnelid;
				cm.executeUpdate(sql);
			}
			finally
			{
				cm.close();
			}
		}
		rd.forward(request, response);
	}
}
