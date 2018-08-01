package crm.manager;

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

public class MCompany extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	//查询客户
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		boolean p = false;
		String personnelid = request.getParameter("personnelid").replace(" ", "");
		if (personnelid.equals(""))
		{
			request.getSession().setAttribute("personnelid", "");
		}
		else
		{
			request.getSession().setAttribute("personnelid", personnelid);
		}
		Integer stype = Integer.valueOf(request.getParameter("stype").replace(" ", ""));
		if (stype.equals(""))
		{
			request.getSession().setAttribute("stype", "");
		}
		else
		{
			request.getSession().setAttribute("stype", stype);
		}
		String content = request.getParameter("content").replace(" ", "");
		if (content.equals(""))
		{
			request.getSession().setAttribute("content", "");
		}
		else
		{
			request.getSession().setAttribute("content", content);
		}
		String industry = request.getParameter("industry").replace(" ", "");
		if (industry.equals(""))
		{
			request.getSession().setAttribute("industry", "");
		}
		else
		{
			request.getSession().setAttribute("industry", industry);
		}
		String state = request.getParameter("state").replace(" ", "");
		if (state.equals(""))
		{
			request.getSession().setAttribute("state", "");
		}
		else
		{
			request.getSession().setAttribute("state", state);
		}
		String type = request.getParameter("type").replace(" ", "");
		if (type.equals(""))
		{
			request.getSession().setAttribute("type", "");
		}
		else
		{
			request.getSession().setAttribute("type", stype);
		}
		String gotime = request.getParameter("gotime").replace(" ", "");
		if (gotime.equals(""))
		{
			request.getSession().setAttribute("gotime", "");
		}
		else
		{
			request.getSession().setAttribute("gotime", gotime);
		}
		String endtime = request.getParameter("endtime").replace(" ", "");
		if (endtime.equals(""))
		{
			request.getSession().setAttribute("endtime", "");
		}
		else
		{
			request.getSession().setAttribute("endtime", endtime);
		}
		String str = "";
		if (!"".equals(personnelid))
		{
			str = str + " personnelid = " + personnelid;
		}
		else
		{
			str = str + " personnelid in (select personnelid from personnel where outdate is null and deptid = "+((Personnel)request.getSession().getAttribute("user")).getDeptid()+")";
		}
		if (!state.equals(""))
		{
			str = str + " and companystate = '" + state+"'";
		}
		if (!"".equals(type))
		{
			str = str + " and type = '" + type+"'";
		}
		if (!("".equals(gotime)&&"".equals(endtime)))
		{
			str = str + " and adddate in (select adddate from company where adddate >= '"+gotime+"' and adddate <= '"+endtime+"')";
		}
		if (!"".equals(content))
		{
			switch (stype)
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
		ConnectManager cm = ConnectManager.newInstance();
		RequestDispatcher rd = null;
		try
		{
			String sql = "select * from company where " + str + " order by adddate desc";
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
						} while (rs.next());
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
			rd = request.getRequestDispatcher("/crm/manager/mcompany.jsp");
			if (p)
			{
				//页面数据量
				int pageSize = 15;
				//设置当前是第一页
				int page = 1;
				//判断是否有传参要得到第几页，同时初始化所有数据
				if (request.getParameter("page") != null)
				{
					page = new Integer(request.getParameter("page"));
				}
				// 总页面数
				int pageCount = companies.size() / pageSize + (companies.size() % pageSize == 0 ? 0 : 1);
				request.setAttribute("csize", "客户量:"+companies.size()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;总页数:"+pageCount);
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
					pageRows.add((Company)companies.get(i));
				}
				// 设当前页的HTML游标
				String htmlPage = "";
				if (companies.size()!=0)
				{

					if (page != 1)
					{
						htmlPage = htmlPage + "&nbsp;<a href='mCompany?page=1&state="+state+"&personnelid="+personnelid+"&type="+type+"&gotime="+gotime+"&endtime="+endtime+"' class='pagenum'>首页</a>";
						htmlPage = htmlPage + "&nbsp;<a href='mCompany?page="
								+ (page - 1) + "&state="+state+"&personnelid="+personnelid+"&type="+type+"&gotime="+gotime+"&endtime="+endtime+"' class='pagenum'>上一页</a>";
					}
					int i = page/10;
					if (i==0)
					{
						++i;
					}
					else
					{
						i*=10;
						++i;
					}
					int j = (i+9);
					if (j>pageCount)
					{
						j=pageCount;
					}
					for (; i <= j; i++)
					{
						if (i!=page)
						{
							htmlPage = htmlPage + "&nbsp;<a href='mCompany?page=" + i
							 + "' class='pagenum'>" + i + "</a>";
						}
						else
						{
							request.getSession().setAttribute("p", "page="+i);
//							request.getSession().setAttribute("pp", "state="+state+"&personnelid="+personnelid+"&type="+type+"&gotime="+gotime+"&endtime="+endtime);
							htmlPage = htmlPage + "&nbsp;" +i;
							request.setAttribute("xls", "<a href='mexport' class='pagenum'>导出Excel表格</a>");
						}
					}
					if (page != pageCount)
					{
						htmlPage = htmlPage + "&nbsp;<a href='mCompany?page="
								+ (page + 1)
								+ "' class='pagenum'>下一页</a>";
						htmlPage = htmlPage + "&nbsp;<a href='mCompany?page="
								+ (pageCount)
								+ "' class='pagenum'>尾页</a>";
					}

				}
				request.setAttribute("htmlPage", htmlPage);
				request.setAttribute("pageRows", pageRows);
			}
		}
		finally
		{
			cm.close();
		}
		rd.forward(request, response);
	}
	//查询客户
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		boolean p = false;
		String personnelid = "";
		if (request.getSession().getAttribute("personnelid")!=null)
		{
			personnelid = request.getSession().getAttribute("personnelid").toString();
		}
		Integer stype = null;
		if (request.getSession().getAttribute("stype")!=null)
		{
			stype = Integer.valueOf(request.getSession().getAttribute("stype").toString());
		}
		String content = "";
		if (request.getSession().getAttribute("content")!=null)
		{
			content = request.getSession().getAttribute("content").toString();
		}
		String industry = "";
		if (request.getSession().getAttribute("industry")!=null)
		{
			industry = request.getSession().getAttribute("industry").toString();
		}
		String state = "";
		if (request.getSession().getAttribute("state")!=null)
		{
			state = request.getSession().getAttribute("state").toString();
		}
		String type = "";
		if (request.getSession().getAttribute("type")!=null)
		{
			type = request.getSession().getAttribute("type").toString();
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
		if (!"".equals(personnelid))
		{
			str = str + " personnelid = " + personnelid;
		}
		else
		{
			str = str + " personnelid in (select personnelid from personnel where outdate is null and deptid = "+((Personnel)request.getSession().getAttribute("user")).getDeptid()+")";
		}
		if (!"".equals(state))
		{
			str = str + " and companystate = '" + state+"'";
		}
		if (!"".equals(type))
		{
			str = str + " and type = '" + type+"'";
		}
		if (!("".equals(gotime)&&"".equals(endtime)))
		{
			str = str + " and adddate in (select adddate from company where adddate >= '"+gotime+"' and adddate <= '"+endtime+"')";
		}
		if (!"".equals(content))
		{
			switch (stype)
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
		ConnectManager cm = ConnectManager.newInstance();
		RequestDispatcher rd = null;
		try
		{
			String sql = "select * from company where " + str + " order by adddate desc";
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
						} while (rs.next());
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
			rd = request.getRequestDispatcher("/crm/manager/mcompany.jsp");
			if (p)
			{
				//页面数据量
				int pageSize = 15;
				//设置当前是第一页
				int page = 1;
				//判断是否有传参要得到第几页，同时初始化所有数据
				if (request.getParameter("page") != null)
				{
					page = new Integer(request.getParameter("page"));
				}
				// 总页面数
				int pageCount = companies.size() / pageSize + (companies.size() % pageSize == 0 ? 0 : 1);
				request.setAttribute("csize", "客户量:"+companies.size()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;总页数:"+pageCount);
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
					pageRows.add((Company)companies.get(i));
				}
				// 设当前页的HTML游标
				String htmlPage = "";
				if (companies.size()!=0)
				{

					if (page != 1)
					{
						htmlPage = htmlPage + "&nbsp;<a href='mCompany?page=1&state="+state+"&personnelid="+personnelid+"&type="+type+"&gotime="+gotime+"&endtime="+endtime+"' class='pagenum'>首页</a>";
						htmlPage = htmlPage + "&nbsp;<a href='mCompany?page="
								+ (page - 1) + "&state="+state+"&personnelid="+personnelid+"&type="+type+"&gotime="+gotime+"&endtime="+endtime+"' class='pagenum'>上一页</a>";
					}
					int i = page/10;
					if (i==0)
					{
						++i;
					}
					else
					{
						i*=10;
						++i;
					}
					int j = (i+9);
					if (j>pageCount)
					{
						j=pageCount;
					}
					for (; i <= j; i++)
					{
						if (i!=page)
						{
							htmlPage = htmlPage + "&nbsp;<a href='mCompany?page=" + i
							 + "' class='pagenum'>" + i + "</a>";
						}
						else
						{
							request.getSession().setAttribute("p", "page="+i);
//							request.getSession().setAttribute("pp", "state="+state+"&personnelid="+personnelid+"&type="+type+"&gotime="+gotime+"&endtime="+endtime);
							htmlPage = htmlPage + "&nbsp;" +i;
							request.setAttribute("xls", "<a href='mexport' class='pagenum'>导出Excel表格</a>");
						}
					}
					if (page != pageCount)
					{
						htmlPage = htmlPage + "&nbsp;<a href='mCompany?page="
								+ (page + 1)
								+ "' class='pagenum'>下一页</a>";
						htmlPage = htmlPage + "&nbsp;<a href='mCompany?page="
								+ (pageCount)
								+ "' class='pagenum'>尾页</a>";
					}

				}
				request.setAttribute("htmlPage", htmlPage);
				request.setAttribute("pageRows", pageRows);
			}
		}
		finally
		{
			cm.close();
		}
		rd.forward(request, response);
	}
}
