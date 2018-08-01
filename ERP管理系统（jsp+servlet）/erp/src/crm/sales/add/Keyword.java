package crm.sales.add;

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


public class Keyword extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	//关键字的查询
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String keyword = request.getParameter("keyword").replace(" ", "");
		request.getSession().setAttribute("keyword", keyword);
		ResultSet rs = null;
		String sql = "select * from company where nameparticular like '%" + keyword+"%'";
		RequestDispatcher rd=null;
		ConnectManager cm = ConnectManager.newInstance();
		if (cm.getConnection())
		{
			rs = cm.executeQuery(sql);
			try
			{
				if (rs.next())
				{
					List<Company> companys = new ArrayList<Company>();
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
						companys.add(company);
					} while (rs.next());
					request.getSession().setAttribute("keywords", companys);
					rd = request.getRequestDispatcher("/crm/add/keywordList.jsp");
				}
				else
				{
					rd = request.getRequestDispatcher("/crm/add/addCompany.jsp");
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
			rd.forward(request, response);
		}
		else
		{
			request.setAttribute("error", "系统故障，请重试或联系管理员");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}
}
