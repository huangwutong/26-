package hrm.select;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.dao.ConnectManager;
import sys.dao.bean.Personnel;


public class PersonnelInfo extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	//员工信息
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		ConnectManager cm = ConnectManager.newInstance();
		String perid = request.getParameter("personnelid");
		if (cm.getConnection())
		{
			String sql = "select * from personnel where personnelid = "+perid;
			ResultSet rs = cm.executeQuery(sql);
			try
			{
				if (rs.next())
				{
					Personnel personnel = new Personnel();
					personnel.setPersonnelid(rs.getInt("personnelid"));
					personnel.setRealname(rs.getString("realname"));
					personnel.setDeptid(rs.getInt("deptid"));
					personnel.setPositionid(rs.getInt("positionid"));
					personnel.setJobid(rs.getString("jobid"));
					personnel.setSex(rs.getByte("sex"));
					personnel.setBirthday(rs.getDate("birthday"));
					personnel.setPnative(rs.getString("native"));
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
					request.getSession().setAttribute("info", personnel);
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
			String page = request.getParameter("size");
			if (page!=null)
			{
				request.setAttribute("page", "page=" + page);
			}
			request.getRequestDispatcher("hrm/select/info.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("error", "系统故障，请重试或联系管理员");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		ConnectManager cm = ConnectManager.newInstance();
		String perid = request.getParameter("personnelid");
		if (cm.getConnection())
		{
			String sql = "select * from personnel where personnelid = "+perid;
			ResultSet rs = cm.executeQuery(sql);
			try
			{
				if (rs.next())
				{
					Personnel personnel = new Personnel();
					personnel.setPersonnelid(rs.getInt("personnelid"));
					personnel.setRealname(rs.getString("realname"));
					personnel.setDeptid(rs.getInt("deptid"));
					personnel.setPositionid(rs.getInt("positionid"));
					personnel.setJobid(rs.getString("jobid"));
					personnel.setSex(rs.getByte("sex"));
					personnel.setBirthday(rs.getDate("birthday"));
					personnel.setPnative(rs.getString("native"));
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
					request.getSession().setAttribute("info", personnel);
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
			String page = request.getParameter("size");
			if (page!=null)
			{
				request.setAttribute("page", "page=" + page);
			}
			request.getRequestDispatcher("hrm/select/info.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("error", "系统故障，请重试或联系管理员");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}
}
