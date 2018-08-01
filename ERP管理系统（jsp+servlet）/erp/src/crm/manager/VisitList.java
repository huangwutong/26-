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
import sys.dao.bean.Personnel;
import sys.dao.bean.Visit;

public class VisitList extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	//查询拜访记录
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		boolean p = false;
		String personnelid = request.getParameter("personnelid").replace(" ", "");
		String gotime = request.getParameter("gotime").replace(" ", "");
		String endtime = request.getParameter("endtime").replace(" ", "");
		String str = "";
		String visittype = request.getParameter("visittype");
		if (!"".equals(personnelid))
		{
			str = str + " and personnelid = " + personnelid;
		}
		else
		{
			str = str + " and personnelid in (select personnelid from personnel where deptid = "+((Personnel)request.getSession().getAttribute("user")).getDeptid()+")";
		}
		if (!("".equals(gotime)&&"".equals(endtime)))
		{
			str = str + " and visittime in (select visittime from visit where visittime >= '"+gotime+"' and visittime <= '"+endtime+"')";
		}
		if (!visittype.equals(""))
		{
			str = str + " and visittype= '"+visittype+"'";
		}
		ConnectManager cm = ConnectManager.newInstance();
		RequestDispatcher rd = request.getRequestDispatcher("/crm/manager/visitList.jsp");;
		try
		{
			String sql = "select * from visit where visittype != 'D' " + str + " order by visittime desc";
			List<Visit> visits = null;
			if (cm.getConnection())
			{
				ResultSet rs = cm.executeQuery(sql);
				try
				{
					
					if (rs.next())
					{
						p = true;
						visits = new ArrayList<Visit>();
						do
						{
							Visit visit = new Visit();
							visit.setVisitid(rs.getInt("visitid"));
							visit.setVisittype(rs.getString("visittype"));
							visit.setVisittime(rs.getDate("visittime"));
							visit.setLinkmanid(rs.getInt("linkmanid"));
							visit.setPersonnelid(rs.getInt("personnelid"));
							visit.setCompanyid(rs.getInt("companyid"));
							visit.setVisitlog(rs.getString("visitlog"));
							visits.add(visit);
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
			if (p)
			{
				//页面数据量
				int pageSize = 10;
				//设置当前是第一页
				int page = 1;
				//判断是否有传参要得到第几页，同时初始化所有数据
				if (request.getParameter("page") != null)
				{
					page = new Integer(request.getParameter("page"));
				}
				// 总页面数
				int pageCount = visits.size() / pageSize + (visits.size() % pageSize == 0 ? 0 : 1);
				request.setAttribute("csize", "总拜访量:"+visits.size()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;总页数:"+pageCount);
				// 定位当前显示页的第一行
				int currentPageFirstRow = (page - 1) * pageSize;
				// 得到当前页的数据
				List<Visit> pageRows = new ArrayList<Visit>();
				for (int i = currentPageFirstRow; i < currentPageFirstRow + pageSize; i++)
				{
					if (i >= visits.size())
					{
						break;
					}
					pageRows.add((Visit)visits.get(i));
				}
				// 设当前页的HTML游标
				String htmlPage = "";
				if (visits.size()!=0)
				{

					if (page != 1)
					{
						htmlPage = htmlPage + "&nbsp;<a href='vList?visittype="+visittype+"&page=1&personnelid="+personnelid+"&gotime="+gotime+"&endtime="+endtime+"' class='pagenum'>首页</a>";
						htmlPage = htmlPage + "&nbsp;<a href='vList?visittype="+visittype+"&page="
								+ (page - 1) + "&personnelid="+personnelid+"&gotime="+gotime+"&endtime="+endtime+"' class='pagenum'>上一页</a>";
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
							htmlPage = htmlPage + "&nbsp;<a href='vList?visittype="+visittype+"&page=" + i
							 + "&personnelid="+personnelid+"&gotime="+gotime+"&endtime="+endtime+"' class='pagenum'>" + i + "</a>";
						}
						else
						{
							htmlPage = htmlPage + "&nbsp;" +i;
						}
					}
					if (page != pageCount)
					{
						htmlPage = htmlPage + "&nbsp;<a href='vList?visittype="+visittype+"&page="
								+ (page + 1)
								+ "&personnelid="+personnelid+"&gotime="+gotime+"&endtime="+endtime+"' class='pagenum'>下一页</a>";
						htmlPage = htmlPage + "&nbsp;<a href='vList?visittype="+visittype+"&page="
								+ (pageCount)
								+ "&personnelid="+personnelid+"&gotime="+gotime+"&endtime="+endtime+"' class='pagenum'>尾页</a>";
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
