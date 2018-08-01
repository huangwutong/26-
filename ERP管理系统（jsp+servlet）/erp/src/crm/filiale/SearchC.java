package crm.filiale;

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

public class SearchC extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// 查询公共库的客户
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		boolean p = false;
		String keywords = request.getParameter("keywords").replace(" ", "");
		request.getSession().setAttribute("keywords", keywords);
		String district = request.getParameter("district").replace(" ", "");
		request.getSession().setAttribute("district", district);
		String industry = request.getParameter("industry").replace(" ", "");
		request.getSession().setAttribute("industry", industry);
		String gotime = request.getParameter("gotime").replace(" ", "");
		request.getSession().setAttribute("gotime", gotime);
		String endtime = request.getParameter("endtime").replace(" ", "");
		request.getSession().setAttribute("endtime", endtime);
		String str = "";
		if (!"".equals(keywords))
		{
			str = str + " and nameparticular like '%" + keywords + "%'";
		}
		if (!"".equals(district))
		{
			str = str + " and districtid = " + Integer.valueOf(district);
		}
		if (!"".equals(industry))
		{
			str = str + " and industryid = " + Integer.valueOf(industry);
		}
		if (!("".equals(gotime) && "".equals(endtime)))
		{
			str = str + " and adddate in (select adddate from company where adddate >= '" + gotime + "' and adddate <= '" + endtime + "')";
		}
		ConnectManager cm = ConnectManager.newInstance();
		RequestDispatcher rd = null;
		try
		{
			String sql = "select * from company where companystate = 'C'" + str + " order by adddate desc";
			List<Company> companies = null;
			if (cm.getConnection())
			{
				ResultSet rs = cm.executeQuery(sql);
				try
				{
					if (rs.next())
					{
						p = true;
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
				}
				catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
			else
			{
				request.setAttribute("error", "系统故障，请重试或联系管理员");
				rd = request.getRequestDispatcher("/error.jsp");
			}
			rd = request.getRequestDispatcher("/crm/filiale/search.jsp");
			if (p)
			{
				// 页面数据量
				int pageSize = 15;
				// 设置当前是第一页
				int page = 1;
				// 判断是否有传参要得到第几页，同时初始化所有数据
				if (request.getParameter("page") != null)
				{
					page = new Integer(request.getParameter("page"));
				}
				// 总页面数
				int pageCount = companies.size() / pageSize + (companies.size() % pageSize == 0 ? 0 : 1);
				// 定位当前显示页的第一行
				int currentPageFirstRow = (page - 1) * pageSize;
				// 得到当前页的数据
				List<Company> pageRows = new ArrayList<Company>();
				for (int i = currentPageFirstRow; i < currentPageFirstRow + pageSize; i++)
				{
					if (i >= companies.size())
					{
						break;
					}
					pageRows.add((Company) companies.get(i));
				}
				// 设当前页的HTML游标
				String htmlPage = "";
				if (companies.size() != 0)
				{

					if (page != 1)
					{
						htmlPage = htmlPage + "&nbsp;<a href='fscarchc?page=1' class='pagenum'>首页</a>";
						htmlPage = htmlPage + "&nbsp;<a href='fscarchc?page=" + (page - 1) + "' class='pagenum'>上一页</a>";
					}
					int i = page / 10;
					if (i == 0)
					{
						++i;
					}
					else
					{
						i *= 10;
					}
					int j = (i + 9);
					if (j > pageCount)
					{
						j = pageCount;
					}
					for (; i <= j; i++)
					{
						if (i != page)
						{
							htmlPage = htmlPage + "&nbsp;<a href='fscarchc?page=" + i +"' class='pagenum'>" + i + "</a>";
						}
						else
						{
							htmlPage = htmlPage + "&nbsp;" + i;
						}
					}
					if (page != pageCount)
					{
						htmlPage = htmlPage + "&nbsp;<a href='fscarchc?page=" + (page + 1) + "' class='pagenum'>下一页</a>";
						htmlPage = htmlPage + "&nbsp;<a href='fscarchc?page=" + (pageCount) + "' class='pagenum'>尾页</a>";
					}

				}
				request.setAttribute("htmlPage", htmlPage);
				request.setAttribute("search", pageRows);
			}
		}
		finally
		{
			cm.close();
		}
		rd.forward(request, response);
	}

	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		boolean p = false;
		String keywords = "";
		if (request.getSession().getAttribute("keywords")!=null)
		{
			keywords = request.getSession().getAttribute("keywords").toString();
		}
		String district = "";
		if (request.getSession().getAttribute("district")!=null)
		{
			district = request.getSession().getAttribute("district").toString();
		}
		String industry = "";
		if (request.getSession().getAttribute("industry")!=null)
		{
			industry = request.getSession().getAttribute("industry").toString();
		}
		String gotime = "";
		if (request.getSession().getAttribute("gotime")!=null)
		{
			gotime = request.getSession().getAttribute("gotime").toString();
		}
		String endtime = "";
		if (request.getSession().getAttribute("endtime")!=null)
		{
			endtime = request.getSession().getAttribute("endtime").toString();
		}
		String str = "";
		if (!"".equals(keywords))
		{
			str = str + " and nameparticular like '%" + keywords + "%'";
		}
		if (!"".equals(district))
		{
			str = str + " and districtid = " + Integer.valueOf(district);
		}
		if (!"".equals(industry))
		{
			str = str + " and industryid = " + Integer.valueOf(industry);
		}
		if (!("".equals(gotime) && "".equals(endtime)))
		{
			str = str + " and adddate in (select adddate from company where adddate >= '" + gotime + "' and adddate <= '" + endtime + "')";
		}
		ConnectManager cm = ConnectManager.newInstance();
		RequestDispatcher rd = null;
		try
		{
			String sql = "select * from company where companystate = 'C'" + str + " order by adddate desc";
			List<Company> companies = null;
			if (cm.getConnection())
			{
				ResultSet rs = cm.executeQuery(sql);
				try
				{
					if (rs.next())
					{
						p = true;
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
				}
				catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
			else
			{
				request.setAttribute("error", "系统故障，请重试或联系管理员");
				rd = request.getRequestDispatcher("/error.jsp");
			}
			rd = request.getRequestDispatcher("/crm/filiale/search.jsp");
			if (p)
			{
				// 页面数据量
				int pageSize = 15;
				// 设置当前是第一页
				int page = 1;
				// 判断是否有传参要得到第几页，同时初始化所有数据
				if (request.getParameter("page") != null)
				{
					page = new Integer(request.getParameter("page"));
				}
				// 总页面数
				int pageCount = companies.size() / pageSize + (companies.size() % pageSize == 0 ? 0 : 1);
				// 定位当前显示页的第一行
				int currentPageFirstRow = (page - 1) * pageSize;
				// 得到当前页的数据
				List<Company> pageRows = new ArrayList<Company>();
				for (int i = currentPageFirstRow; i < currentPageFirstRow + pageSize; i++)
				{
					if (i >= companies.size())
					{
						break;
					}
					pageRows.add((Company) companies.get(i));
				}
				// 设当前页的HTML游标
				String htmlPage = "";
				if (companies.size() != 0)
				{

					if (page != 1)
					{
						htmlPage = htmlPage + "&nbsp;<a href='fscarchc?page=1' class='pagenum'>首页</a>";
						htmlPage = htmlPage + "&nbsp;<a href='fscarchc?page=" + (page - 1) + "' class='pagenum'>上一页</a>";
					}
					int i = page / 10;
					if (i == 0)
					{
						++i;
					}
					else
					{
						i *= 10;
					}
					int j = (i + 9);
					if (j > pageCount)
					{
						j = pageCount;
					}
					for (; i <= j; i++)
					{
						if (i != page)
						{
							htmlPage = htmlPage + "&nbsp;<a href='fscarchc?page=" + i +"' class='pagenum'>" + i + "</a>";
						}
						else
						{
							htmlPage = htmlPage + "&nbsp;" + i;
						}
					}
					if (page != pageCount)
					{
						htmlPage = htmlPage + "&nbsp;<a href='fscarchc?page=" + (page + 1) + "' class='pagenum'>下一页</a>";
						htmlPage = htmlPage + "&nbsp;<a href='fscarchc?page=" + (pageCount) + "' class='pagenum'>尾页</a>";
					}

				}
				request.setAttribute("htmlPage", htmlPage);
				request.setAttribute("search", pageRows);
			}
		}
		finally
		{
			cm.close();
		}
		rd.forward(request, response);
	}
}
