package sys.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.dao.ConnectManager;
import sys.dao.bean.Personnel;

public class LoginChickUserName extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String userName = request.getParameter("userName").replace(" ", "");
		int userInt = 0;
		if (request.getSession().getAttribute("userInt") != null)
		{
			userInt = new Integer(request.getSession().getAttribute("userInt").toString());
		}
		if (userInt < 3)
		{
			String sql = "select * from personnel where username = '" + userName + "'";
			ConnectManager cm = ConnectManager.newInstance();
			Personnel personnel = null;
			if (cm.getConnection())
			{
				ResultSet rs = cm.executeQuery(sql);
				try
				{
					if (rs.next())
					{
						personnel = new Personnel();
						personnel.setPersonnelid(rs.getInt("personnelid"));
						personnel.setRealname(rs.getString("realname"));
						personnel.setDeptid(rs.getInt("deptid"));
						personnel.setPositionid(rs.getInt("positionid"));
						personnel.setJobid(rs.getString("jobid"));
						personnel.setSex(rs.getByte("sex"));
						personnel.setBirthday(rs.getDate("birthday"));
						personnel.setNation(rs.getString("native"));
						personnel.setNation(rs.getString("nation"));
						personnel.setPolity(rs.getString("polity"));
						personnel.setWedlock(rs.getByte("wedlock"));
						personnel.setIdcardno(rs.getString("idcardno"));
						personnel.setIdcardaddress(rs.getString("idcardaddress"));
						personnel.setSocialinsuranceid(rs.getString("socialinsuranceid"));
						personnel.setFinishschool(rs.getString("finishschool"));
						personnel.setSpecialty(rs.getString("specialty"));
						personnel.setAcademic(rs.getString("academic"));
						personnel.setDwelling(rs.getString("dwelling"));
						personnel.setAdddate(rs.getDate("adddate"));
						personnel.setOutdate(rs.getDate("outdate"));
						personnel.setPassdate(rs.getDate("passdate"));
						personnel.setUsername(rs.getString("username"));
						personnel.setPassword(rs.getString("password"));
						personnel.setIslock(rs.getByte("islock"));
						personnel.setA(rs.getInt("A"));
						personnel.setB(rs.getInt("B"));
						request.getSession().setAttribute("user", personnel);
						response.getWriter().print("yes");
					}
					else
					{
						request.getSession().setAttribute("userInt", ++userInt);
						response.getWriter().print("no");
					}
					rs.close();
				}
				catch (SQLException e)
				{
					e.printStackTrace();
				}
				finally
				{
					cm.close();
				}
			}
			else
			{
				response.getWriter().print("error");
			}
		}
		else
		{
			response.getWriter().print("out");
		}
	}
}
