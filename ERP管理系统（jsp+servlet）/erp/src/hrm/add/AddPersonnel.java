package hrm.add;

import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.cls.MD5;
import sys.cls.Replace;
import sys.dao.ConnectManager;


public class AddPersonnel extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	//添加员工信息
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String jobid = request.getParameter("jobId");
		String deptid = request.getParameter("dept");
		RequestDispatcher rd = request.getRequestDispatcher("/succ.jsp");
		ConnectManager cm = ConnectManager.newInstance();
		Integer a = 0;
		Integer b = 0;
		Integer c = null;
		if (cm.getConnection())
		{
			try
			{
				ResultSet rs = cm.executeQuery("select A from dept where deptid = "+deptid);
				try
				{
					rs.next();
					a = rs.getInt("A");
					rs = cm.executeQuery("select B from dept where deptid = "+deptid);
					rs.next();
					b = rs.getInt("B");
					rs.close();
				}
				catch (SQLException e)
				{
					e.printStackTrace();
				}
				String sql = "insert into personnel values " +
				"('"+Replace.pep(request.getParameter("realName"))+"',"+deptid+","+Replace.pep(request.getParameter("positioned"))+",'" +
				jobid+"',"+Replace.pep(request.getParameter("sex"))+",'"+Replace.pep(request.getParameter("birthday"))+"','"+Replace.pep(request.getParameter("native_"))+"'," +
				"'"+Replace.pep(request.getParameter("nation"))+"','"+Replace.pep(request.getParameter("polity"))+"',"+Replace.pep(request.getParameter("wedlock"))+"," +
				"'"+Replace.pep(request.getParameter("idCardNo"))+"','"+Replace.pep(request.getParameter("idCardAddress"))+"','"+Replace.pep(request.getParameter("socialinsuranceid"))+"'," +
				"'"+Replace.pep(request.getParameter("finishSchool"))+"','"+Replace.pep(request.getParameter("specialty"))+"','"+Replace.pep(request.getParameter("academic"))+"'," +
				"'"+Replace.pep(request.getParameter("dwelling"))+"','"+Date.valueOf(DateFormat.getDateInstance(DateFormat.DEFAULT).format(new java.util.Date()))+"',null," +
				"null,'"+jobid+"','"+MD5.md5(jobid)+"',null,"+a+","+b+","+c+")";
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
