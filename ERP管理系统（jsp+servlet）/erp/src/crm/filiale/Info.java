package crm.filiale;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.dao.ConnectManager;
import sys.dao.bean.Company;


public class Info extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	//经理查看客户资料
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		ConnectManager cm = ConnectManager.newInstance();
		String comid = request.getParameter("companyid").replace(" ", "");
		if (cm.getConnection())
		{
			String sql = "select * from company where companyid = "+comid;
			ResultSet rs = cm.executeQuery(sql);
			try
			{
				if (rs.next())
				{
					Company company = new Company();
					company.setCompanyid(rs.getInt("companyid"));
					company.setNamekeywords(rs.getString("namekeywords"));
					company.setNameparticular(rs.getString("nameparticular"));
					company.setDistrictid(rs.getInt("districtid"));
					company.setCompanyaddress(rs.getString("companyaddress"));
					company.setType(rs.getString("type"));
					company.setNeturl(rs.getString("neturl"));
					company.setCompanytype(rs.getString("companytype"));
					company.setCompanystate(rs.getString("companystate"));
					company.setAdddate(rs.getDate("adddate"));
					company.setIndate(rs.getDate("indate"));
					company.setCompanynarrate(rs.getString("companynarrate"));
					company.setPersonnelid(rs.getInt("personnelid"));
					company.setAccepterid(rs.getInt("accepterid"));
					company.setLastPersonnelid(rs.getInt("lastPersonnel"));
					company.setLastvisitdate(rs.getDate("lastvisitdate"));
					company.setVisitcount(rs.getInt("visitcount"));
					company.setIndustryid(rs.getInt("industryid"));
					request.setAttribute("info", company);
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
			request.setAttribute("c",request.getParameter("c"));
			request.setAttribute("s",request.getParameter("s"));
			request.setAttribute("f",request.getParameter("f"));
			request.getRequestDispatcher("crm/filiale/info.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("error", "系统故障，请重试或联系管理员");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}
}
