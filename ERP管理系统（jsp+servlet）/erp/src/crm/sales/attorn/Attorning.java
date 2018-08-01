package crm.sales.attorn;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.dao.ConnectManager;
import sys.dao.bean.Company;
import sys.dao.bean.Personnel;

public class Attorning extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	//转让中的客户
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		ConnectManager cm = ConnectManager.newInstance();
		RequestDispatcher rd = request.getRequestDispatcher("/crm/attorn/attorning.jsp");
		if (cm.getConnection())
		{
			try
			{
				Personnel user = (Personnel) request.getSession().getAttribute("user");
				String sql = "select * from company where personnelid=" + user.getPersonnelid() + " and accepterid is not null";
				ResultSet rs = cm.executeQuery(sql);
				List<Company> companies = null;
				try
				{
					if (rs.next())
					{
						companies = new ArrayList<Company>();
						do
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
							companies.add(company);
						}
						while (rs.next());
					}
					rs.close();
					request.setAttribute("cleints", companies);
				}
				catch (SQLException e)
				{
					e.printStackTrace();
				}
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
