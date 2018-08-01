package crm.sales.add;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.cls.Replace;
import sys.dao.ConnectManager;
import sys.dao.bean.Company;
import sys.dao.bean.Industry;
import sys.dao.bean.Linkman;
import sys.dao.bean.Personnel;


public class AddCompany extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	//添加公司信息与联系人信息
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String industry = Replace.pep(request.getParameter("industry"));
		Integer industryint = 0;
		String par = Replace.pep(request.getParameter("nameParticular"));
		ConnectManager cm = ConnectManager.newInstance();
		RequestDispatcher rd = request.getRequestDispatcher("/succ.jsp");
		ResultSet rs = null;
		boolean b = false;
		if (cm.getConnection())
		{
			String sql = "select * from company where nameparticular = '"+par+"'";
			rs = cm.executeQuery(sql);
			try
			{
				if (rs.next())
				{
					request.setAttribute("error", "这个公司已经存在，不可以再进行添加");
					rd = request.getRequestDispatcher("/error.jsp");
				}
				else
				{
					b = true;
				}
				rs.close();
				industryint = Integer.valueOf(industry);
			}
			catch (NumberFormatException e)
			{
				sql = "select * from industry where industry = '"+industry+"'";
				rs = cm.executeQuery(sql);
				try
				{
					if (rs.next())
					{
						industryint = rs.getInt("industryid");
					}
					else
					{
						sql = "insert into industry values('"+industry+"',1)";
						cm.executeUpdate(sql);
						sql = "select * from industry where industry = '"+industry+"'";
						rs = cm.executeQuery(sql);
						if (rs.next())
						{
							industryint = rs.getInt("industryid");
							List<Industry> list = (List<Industry>)request.getSession().getServletContext().getAttribute("industrys");
							Industry ind = new Industry();
							ind.setIndustryid(industryint);
							ind.setIndustry(rs.getString("industry"));
							list.add(ind);
							request.getSession().getServletContext().setAttribute("industrys", list);
						}
					}
					rs.close();
				}
				catch (SQLException sqle)
				{
					sqle.printStackTrace();
				}
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
			request.setAttribute("error", "系统故障，请重试或联系管理员");
			rd = request.getRequestDispatcher("/error.jsp");
		}
		if (b)
		{
			Personnel user = (Personnel)request.getSession().getAttribute("user");
			Company company = new Company();
			company.setNamekeywords(Replace.pep(request.getParameter("nameKeywords")));
			company.setNameparticular(par);
			company.setCompanyaddress(Replace.pep(request.getParameter("companyAddress")));
			company.setNeturl(Replace.pep(request.getParameter("neturl")));
			company.setDistrictid(Integer.valueOf(request.getParameter("district")));
			company.setIndustryid(industryint);
			company.setCompanynarrate(Replace.pep(request.getParameter("companyNarrate")));
			company.setPersonnelid(user.getPersonnelid());
			company.setAddPersonnelid(user.getPersonnelid());
			company.insert();
			company.getnew();
			Linkman linkman = new Linkman();
			linkman.setLinkmanname(Replace.pep(request.getParameter("linkmanName")));
			linkman.setLinkmanphone(Replace.pep(request.getParameter("linkmanPhone")));
			linkman.setLinkmanmoblie(Replace.pep(request.getParameter("linkmanMoblie")));
			linkman.setLinkmanemail(Replace.pep(request.getParameter("linkmanEmail")));
			linkman.setJob(Replace.pep(request.getParameter("job")));
			linkman.setCompanyid(company.getCompanyid());
			linkman.setCompany(company);
			linkman.insert();
			linkman.getnew();
			request.getSession().setAttribute("info",company);
			request.setAttribute("success", "添加客户成功!<a href='chick' class='pagenum' >继续添加</a>&nbsp;&nbsp;&nbsp;<a href='turn?type=av&linkmanid="+linkman.getLinkmanid()+"' class='pagenum'>添加拜访记录</a>");
			rd = request.getRequestDispatcher("/succ.jsp");
		}
		rd.forward(request, response);
	}
}
