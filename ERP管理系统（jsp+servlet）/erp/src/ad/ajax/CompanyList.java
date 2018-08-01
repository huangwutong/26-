package ad.ajax;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.dao.ConnectManager;
import sys.dao.bean.Company;
import sys.dao.bean.Personnel;

@SuppressWarnings("serial")
public class CompanyList extends HttpServlet
{

	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String companyName=request.getParameter("company");
		companyName=new String(companyName.getBytes("iso8859-1"),"GBK");
		String backtrack ="";
		Personnel personnel = (Personnel)request.getSession().getAttribute("user");
		List<Company> companies = null;
		ConnectManager cm = ConnectManager.newInstance();
		if (cm.getConnection())
		{
			String sql = "select * from company where nameparticular like '%"+companyName+"%' and personnelid = "+personnel.getPersonnelid();
			ResultSet rs = cm.executeQuery(sql);
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
						company.setAddPersonnelid(rs.getInt("addPersonnel"));
						companies.add(company);
					} while (rs.next());
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
		backtrack = "<table width='100%' border='0' id='companeyTable' cellpadding='8' cellspacing='1' class='contentListTable2'>";
		backtrack=backtrack +"<tr><td class='contentListTdColName'>&nbsp;</td><td class='contentListTdColName'>客户公司名</td>";
		if (companies!=null)
		{
			for (int i = 0; i < companies.size(); i++)
			{
				backtrack=backtrack +"<tr><td class='contentListTd'><input type='radio' name='companyId' value='"+companies.get(i).getCompanyid()+"'/></td><td class='contentListTd'>"+companies.get(i).getNameparticular()+"</td>";
			}
		}
		backtrack =backtrack +"</table></br>";
		response.getWriter().println(backtrack);
	}
}
