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
import sys.dao.bean.Personnel;
import sys.dao.bean.Visit;

public class VisitList extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	//拜访记录的查询
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		boolean p = false;
		ConnectManager cm = ConnectManager.newInstance();
		RequestDispatcher rd = null;
		ResultSet rs = null;
		String dept = request.getParameter("deptid").replace(" ", "");
		String personnelid = request.getParameter("personnelid").replace(" ", "");
		String gotime = request.getParameter("gotime").replace(" ", "");
		String endtime = request.getParameter("endtime").replace(" ", "");
		String temp = "";
		String sql = "";
		String str = "";
		String string = "";
		List<Visit> visits = null;
		List<String> list = new ArrayList<String>();
		String sqltemp = "";
		String visittype = request.getParameter("visittype");
		rd = request.getRequestDispatcher("/crm/filiale/visitList.jsp");
		try
		{
			if (cm.getConnection())
			{
				try
				{
					if (!"".equals(personnelid))
					{
						str = str + " personnelid in (" + personnelid + ")";
						if (!("".equals(gotime) && "".equals(endtime)))
						{
							temp = temp + " and visittime in (select visittime from visit where visittime >= '" + gotime + "' and visittime <= '" + endtime + "')";
						}
						if (!visittype.equals(""))
						{
							temp = temp + " and visittype= '"+visittype+"'";
						}
						// 开始进行统计
						// 统计查询结果的总条数
						sql = "select count(*) from visit where visittype != 'D' and " + str + temp;
						rs = cm.executeQuery(sql);
						rs.next();
						int i = rs.getInt(1);
						// 查询是哪个业务员的记录
						sql = "select * from personnel where" + str;
						rs = cm.executeQuery(sql);
						if (rs.next())
						{
							list.add(rs.getString("realname") + "已查询到的拜访数是:" + i);
							//统计在查询结是中的电话拜访数据
							sql = "select count(*) from visit where visittype = 'A' and " + str + temp;
							//统计在查询结是中的电话拜访数据
							rs = cm.executeQuery(sql);
							rs.next();
							string = string + "电话拜访数量:" + rs.getInt(1);
							//统计在查询结是中的上门拜访数据
							sql = "select count(*) from visit where visittype = 'B' and " + str + temp;
							rs = cm.executeQuery(sql);
							rs.next();
							string = string + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上门拜访数量:" + rs.getInt(1);
							//统计在查询结是中的邮件拜访数据
							sql = "select count(*) from visit where visittype = 'C' and " + str + temp;
							rs = cm.executeQuery(sql);
							rs.next();
							string = string + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮件拜访数量:" + rs.getInt(1);
							list.add(string);
							request.setAttribute("list", list);
						}
					}
					else
					{
						if (!"".equals(dept))
						{
							str = str + " personnelid in (select personnelid from personnel where outdate is null and deptid = " + dept + ")";
							if (!("".equals(gotime) && "".equals(endtime)))
							{
								temp = temp + " and visittime in (select visittime from visit where visittime >= '" + gotime + "' and visittime <= '" + endtime + "')";
							}
							if (!visittype.equals(""))
							{
								temp = temp + " and visittype= '"+visittype+"'";
							}

							// 开始进行统计
							// 统计查询结果的总条数
							sql = "select count(*) from visit where visittype != 'D' and " + str + temp;
							rs = cm.executeQuery(sql);
							rs.next();
							int i = rs.getInt(1);
							// 查询是哪个部门的记录
							sql = "select * from dept where deptid = " + dept;
							rs = cm.executeQuery(sql);
							if (rs.next())
							{
								list.add(rs.getString("deptname") + "已查询到的拜访数是:" + i);
								//统计在查询结是中的电话拜访数据
								sql = "select count(*) from visit where visittype = 'A' and " + str + temp;
								rs = cm.executeQuery(sql);
								rs.next();
								string = string + "电话拜访数量:" + rs.getInt(1);
								//统计在查询结是中的上门拜访数据
								sql = "select count(*) from visit where visittype = 'B' and " + str + temp;
								rs = cm.executeQuery(sql);
								rs.next();
								string = string + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上门拜访数量:" + rs.getInt(1);
								//统计在查询结是中的邮件拜访数据
								sql = "select count(*) from visit where visittype = 'C' and " + str + temp;
								rs = cm.executeQuery(sql);
								rs.next();
								string = string + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮件拜访数量:" + rs.getInt(1);
								list.add(string);
								// 查询出当前部门的员工
								List<Integer> pid = new ArrayList<Integer>();
								sql = "select personnelid from personnel where outdate is null and deptid = " + dept;
								rs = cm.executeQuery(sql);
								while (rs.next())
								{
									pid.add(rs.getInt(1));
								}
								// 开始统读业务员的信息
								for (Integer id : pid)
								{
									string = "";
									sqltemp = " personnelid = " + id;
									// 统计业务员的总条数
									sql = "select count(*) from visit where visittype != 'D' and " + sqltemp + temp;
									rs = cm.executeQuery(sql);
									rs.next();
									i = rs.getInt(1);
									// 查询是哪个业务员的记录
									sql = "select * from personnel where" + sqltemp;
									rs = cm.executeQuery(sql);
									if (rs.next())
									{
										list.add(rs.getString("realname") + "已查询到的拜访数是:" + i);
										//统计在查询结是中的电话拜访数据
										sql = "select count(*) from visit where visittype = 'A' and " + sqltemp + temp;
										rs = cm.executeQuery(sql);
										rs.next();
										string = string + "电话拜访数量:" + rs.getInt(1);
										//统计在查询结是中的上门拜访数据
										sql = "select count(*) from visit where visittype = 'B' and " + sqltemp + temp;
										rs = cm.executeQuery(sql);
										rs.next();
										string = string + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上门拜访数量:" + rs.getInt(1);
										//统计在查询结是中的邮件拜访数据
										sql = "select count(*) from visit where visittype = 'C' and " + sqltemp + temp;
										rs = cm.executeQuery(sql);
										rs.next();
										string = string + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮件拜访数量:" + rs.getInt(1);
									}
									list.add(string);
								}
							}
							request.setAttribute("list", list);
						}
						else
						{
							if(request.getSession().getAttribute("pos")!=null)
							{
								str = str + "personnelid in (select personnelid from personnel where outdate is null and deptid in (select deptid from dept where gradeid = " + ((Personnel) request.getSession().getAttribute("user")).getDept().getGradeid() + " and CHARINDEX('"+request.getSession().getAttribute("pos")+"',deptname)>0))";
							}
							else
							{
								str = str + "personnelid in (select personnelid from personnel where outdate is null and deptid in (select deptid from dept where gradeid = " + ((Personnel) request.getSession().getAttribute("user")).getDept().getGradeid() + "))";
							}
							if (!("".equals(gotime) && "".equals(endtime)))
							{
								str = str + " and visittime in (select visittime from visit where visittime >= '" + gotime + "' and visittime <= '" + endtime + "')";
							}
							if (!visittype.equals(""))
							{
								temp = temp + " and visittype= '"+visittype+"'";
							}
							// 开始进行统计
							// 统计查询结果的总条数
							sql = "select count(*) from visit where visittype != 'D' and " + str + temp;
							rs = cm.executeQuery(sql);
							rs.next();
							int i = rs.getInt(1);
							if(request.getSession().getAttribute("pos")!=null)
							{
								list.add("分公司"+request.getSession().getAttribute("pos")+"部已查询到的拜访数是:" + i);
							}
							else
							{
								list.add("分公司已查询到的拜访数是:" + i);
							}
							//统计在查询结是中的电话拜访数据
							sql = "select count(*) from visit where visittype = 'A' and " + str + temp;
							rs = cm.executeQuery(sql);
							rs.next();
							string = string + "电话拜访数量:" + rs.getInt(1);
							//统计在查询结是中的上门拜访数据
							sql = "select count(*) from visit where visittype = 'B' and " + str + temp;
							rs = cm.executeQuery(sql);
							rs.next();
							string = string + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上门拜访数量:" + rs.getInt(1);
							//统计在查询结是中的邮件拜访数据
							sql = "select count(*) from visit where visittype = 'C' and " + str + temp;
							rs = cm.executeQuery(sql);
							rs.next();
							string = string + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮件拜访数量:" + rs.getInt(1);
							list.add(string);
							// 查询出所有
							List<Integer> did = new ArrayList<Integer>();
							if(request.getSession().getAttribute("pos")!=null)
							{
								sql = "select deptid from dept where gradeid = " + ((Personnel) request.getSession().getAttribute("user")).getDept().getGradeid()+" and CHARINDEX('"+request.getSession().getAttribute("pos")+"',deptname)>0";
							}
							else
							{
								sql = "select deptid from dept where gradeid = " + ((Personnel) request.getSession().getAttribute("user")).getDept().getGradeid();
							}
							rs = cm.executeQuery(sql);
							while (rs.next())
							{
								if (rs.getInt(1) != ((Personnel) request.getSession().getAttribute("user")).getDeptid().intValue())
								{
									did.add(rs.getInt(1));
								}
							}
							// 开始统读部门的信息
							for (Integer id : did)
							{
								string = "";
								sqltemp = " personnelid in (select personnelid from personnel where outdate is null and deptid = " + id + ")";
								sql = "select count(*) from visit where visittype != 'D' and " + sqltemp + temp;
								rs = cm.executeQuery(sql);
								rs.next();
								i = rs.getInt(1);
								// 查询部门的记录
								sql = "select * from dept where deptid = " + id;
								rs = cm.executeQuery(sql);
								rs.next();
								list.add(rs.getString("deptname") + "已查询到的客户数是:" + i);
								//统计在查询结是中的电话拜访数据
								sql = "select count(*) from visit where visittype = 'A' and " + sqltemp + temp;
								rs = cm.executeQuery(sql);
								rs.next();
								string = string + "电话拜访数量:" + rs.getInt(1);
								//统计在查询结是中的上门拜访数据
								sql = "select count(*) from visit where visittype = 'B' and " + sqltemp + temp;
								rs = cm.executeQuery(sql);
								rs.next();
								string = string + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上门拜访数量:" + rs.getInt(1);
								//统计在查询结是中的邮件拜访数据
								sql = "select count(*) from visit where visittype = 'C' and " + str + temp;
								rs = cm.executeQuery(sql);
								rs.next();
								string = string + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮件拜访数量:" + rs.getInt(1);
								list.add(string);
							}
							request.setAttribute("list", list);
						}
					}
					str += temp;
					sql = "select * from visit where visittype != 'D' and " + str + " order by visittime desc";
					rs = cm.executeQuery(sql);
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
			if (p)
			{
				// 页面数据量
				int pageSize = 10;
				// 设置当前是第一页
				int page = 1;
				// 判断是否有传参要得到第几页，同时初始化所有数据
				if (request.getParameter("page") != null)
				{
					page = new Integer(request.getParameter("page"));
				}
				// 总页面数
				int pageCount = visits.size() / pageSize + (visits.size() % pageSize == 0 ? 0 : 1);
				request.setAttribute("csize", "总拜访量:" + visits.size() + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;总页数:" + pageCount);
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
					pageRows.add((Visit) visits.get(i));
				}
				// 设当前页的HTML游标
				String htmlPage = "";
				if (visits.size() != 0)
				{

					if (page != 1)
					{
						htmlPage = htmlPage + "&nbsp;<a href='fvList?visittype="+visittype+"&page=1&deptid=" + dept + "&personnelid=" + personnelid + "&gotime=" + gotime + "&endtime=" + endtime + "' class='pagenum'>首页</a>";
						htmlPage = htmlPage + "&nbsp;<a href='fvList?visittype="+visittype+"&page=" + (page - 1) + "&deptid=" + dept + "&personnelid=" + personnelid + "&gotime=" + gotime + "&endtime=" + endtime + "' class='pagenum'>上一页</a>";
					}
					int i = page / 10;
					if (i == 0)
					{
						++i;
					}
					else
					{
						i *= 10;
						++i;
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
							htmlPage = htmlPage + "&nbsp;<a href='fvList?visittype="+visittype+"&page=" + i + "&deptid=" + dept + "&personnelid=" + personnelid + "&gotime=" + gotime + "&endtime=" + endtime + "' class='pagenum'>" + i + "</a>";
						}
						else
						{
							htmlPage = htmlPage + "&nbsp;" + i;
						}
					}
					if (page != pageCount)
					{
						htmlPage = htmlPage + "&nbsp;<a href='fvList?visittype="+visittype+"&page=" + (page + 1) + "&deptid=" + dept + "&personnelid=" + personnelid + "&gotime=" + gotime + "&endtime=" + endtime + "' class='pagenum'>下一页</a>";
						htmlPage = htmlPage + "&nbsp;<a href='fvList?visittype="+visittype+"&page=" + (pageCount) + "&deptid=" + dept + "&personnelid=" + personnelid + "&gotime=" + gotime + "&endtime=" + endtime + "' class='pagenum'>尾页</a>";
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
