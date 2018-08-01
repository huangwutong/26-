package crm.sales.searchab;

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

public class Search extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	//搜索我的客户
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		boolean p = false;
		Integer type = Integer.valueOf(request.getParameter("type").replace(" ", ""));
		String content = request.getParameter("content").replace(" ", "");
		String industry = request.getParameter("industry").replace(" ", "");
		String gotime = request.getParameter("gotime").replace(" ", "");
		String endtime = request.getParameter("endtime").replace(" ", "");
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		String str = "";
		List<Company> companies = null;
		if (!"".equals(content))
		{
			switch (type)
			{
				case 1:
					str += " and nameparticular like '%" + content + "%'";
					break;
				case 2:
					str += " and companyaddress like '%" + content + "%'";
					break;
				case 3:
					str += " and companyid = (select companyid from linkman where linkmanmoblie = '" + content + "')";
					break;
				case 4:
					str += " and companyid = (select companyid from linkman where linkmanphone = '" + content + "')";
					break;
				default:
					str += " and companyid = (select companyid from linkman where linkmanemail = '" + content + "')";
					break;
			}
		}
		if (!"".equals(industry))
		{
			str = str + " and industryid = " + Integer.valueOf(industry);
		}
		if (!("".equals(gotime) && "".equals(endtime)))
		{
			str = str + " and indate in (select indate from company where indate >= '" + gotime + "' and indate <= '" + endtime + "')";
		}
		ConnectManager cm = ConnectManager.newInstance();
		RequestDispatcher rd = null;
		try
		{

			String sql = "select * from company where personnelid = " + user.getPersonnelid() + str+ " order by adddate desc";
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
					request.getSession().setAttribute("coms", companies);
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
			rd = request.getRequestDispatcher("/crm/searchab/search.jsp");
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
						htmlPage = htmlPage + "&nbsp;<a href='searchab?page=1' class='pagenum'>首页</a>";
						htmlPage = htmlPage + "&nbsp;<a href='searchab?page=" + (page - 1) + "' class='pagenum'>上一页</a>";
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
							htmlPage = htmlPage + "&nbsp;<a href='searchab?page=" + i + "' class='pagenum'>" + i + "</a>";
						}
						else
						{
							htmlPage = htmlPage + "&nbsp;" + i;
							request.setAttribute("page", "page=" + i);
						}
					}
					if (page != pageCount)
					{
						htmlPage = htmlPage + "&nbsp;<a href='searchab?page=" + (page + 1) + "' class='pagenum'>下一页</a>";
						htmlPage = htmlPage + "&nbsp;<a href='searchab?page=" + (pageCount) + "' class='pagenum'>尾页</a>";
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
		List<Company> companies = (List<Company>) request.getSession().getAttribute("coms");
		RequestDispatcher rd = request.getRequestDispatcher("/crm/searchab/search.jsp");
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
				htmlPage = htmlPage + "&nbsp;<a href='searchab?page=1' class='pagenum'>首页</a>";
				htmlPage = htmlPage + "&nbsp;<a href='searchab?page=" + (page - 1) + "' class='pagenum'>上一页</a>";
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
					htmlPage = htmlPage + "&nbsp;<a href='searchab?page=" + i + "' class='pagenum'>" + i + "</a>";
				}
				else
				{
					htmlPage = htmlPage + "&nbsp;" + i;
					request.setAttribute("page", "page=" + i);
				}
			}
			if (page != pageCount)
			{
				htmlPage = htmlPage + "&nbsp;<a href='searchab?page=" + (page + 1) + "' class='pagenum'>下一页</a>";
				htmlPage = htmlPage + "&nbsp;<a href='searchab?page=" + (pageCount) + "' class='pagenum'>尾页</a>";
			}

		}
		request.setAttribute("htmlPage", htmlPage);
		request.setAttribute("search", pageRows);
		rd.forward(request, response);
	}
}
