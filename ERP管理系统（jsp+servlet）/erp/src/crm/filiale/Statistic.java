package crm.filiale;

import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.dao.ConnectManager;
import sys.dao.bean.Personnel;

public class Statistic extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// 部门经理统计员工客户
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// 参数初始化
		ConnectManager cm = ConnectManager.newInstance();
		RequestDispatcher rd = request.getRequestDispatcher("crm/filiale/statistic.jsp");
		String dept = request.getParameter("deptid").replace(" ", "");
		String personnelid = request.getParameter("personnelid").replace(" ", "");
		String statType = request.getParameter("statType").replace(" ", "");
		String gotime = request.getParameter("gotime").replace(" ", "");
		String endtime = request.getParameter("endtime").replace(" ", "");
		ResultSet rs = null;
		String sql = "";
		List<String> list = new ArrayList<String>();
		String str = "";
		String temp = "";
		Calendar goDate = Calendar.getInstance();
		Calendar endDate = Calendar.getInstance();
		goDate.setTime(Date.valueOf(gotime));
		endDate.setTime(Date.valueOf(endtime));
		try
		{
			// 打开数据库
			if (cm.getConnection())
			{
				try
				{
					// 开始拼装SQL
					if (!"".equals(personnelid))
					{
						// 这一段SQL是统计与查询通用的
						sql = "select * from personnel where personnelid = " + personnelid;
						rs = cm.executeQuery(sql);
						rs.next();
						str = str + " addPersonnel in (" + personnelid + ")";
						if ("1".equals(statType))
						{	
							list.add("<h3>"+rs.getString("realname")+goDate.get(Calendar.YEAR)+"年"+endDate.get(Calendar.YEAR)+"年"+"期间年增量客户统计</h3>");
							int year = goDate.get(Calendar.YEAR);
							while (year<=endDate.get(Calendar.YEAR))
							{
								temp = " and adddate in (select adddate from company where adddate >= '" + 
								(year+"-"+1+"-"+1) + 
								"' and adddate <= '" + (year +"-" + 12 + "-" + 31) + "')";
								sql = "select count(*) from company where " + str + temp;
								rs = cm.executeQuery(sql);
								rs.next();
								int i = rs.getInt(1);
								if (i==0)
								{
									list.add("<table width='100%' border='0' cellpadding='8' cellspacing='0' class='contentListTable'>" +
											"<tr bgcolor='#FFFFFF'><td bgcolor='#FFFFFF' width='90px'>"+year+"年新增客户</td>" +
											"<td align='lefp'>"+0+"个</td></tr></table>");
								}
								else
								{
									list.add("<table width='100%' border='0' cellpadding='8' cellspacing='0' class='contentListTable'>" +
											"<tr bgcolor='#FFFFFF'><td bgcolor='#FFFFFF' width='90px'>"+year+"年新增客户</td>" +
											"<td align='center' width='"+i/100+"px'><div style='height:10px;background:#ff0000;width:"+i/100+"px'></div></td><td align='lefp'>"+i+"个</td></tr></table><br/>");
								}
								++year;
							}
						}
						else if("2".equals(statType))
						{
							list.add("<h3>"+rs.getString("realname")+goDate.get(Calendar.YEAR)+"年"+(goDate.get(Calendar.MONTH)+1)+"月--"+endDate.get(Calendar.YEAR)+"年"+(endDate.get(Calendar.MONTH)+1)+"月"+"期间月增量客户统计</h3>");
							int year = goDate.get(Calendar.YEAR);
							int month = (goDate.get(Calendar.MONTH)+1);
							int endmonth = 12;
							Calendar tempc = Calendar.getInstance();
							while (year<=endDate.get(Calendar.YEAR))
							{
								if (year!=goDate.get(Calendar.YEAR))
								{
									month = 1;
								}
								if (year==endDate.get(Calendar.YEAR))
								{
									endmonth = (endDate.get(Calendar.MONTH)+1);
								}
								while (month <= endmonth)
								{
									tempc.setTime(Date.valueOf(year +"-" + month + "-" + 1));
									temp = " and adddate in (select adddate from company where adddate >= '" + 
									(year+"-"+month+"-"+1) + 
									"' and adddate <= '" + (year +"-" + month + "-" + tempc.getActualMaximum(Calendar.DATE)) + "')";
									sql = "select count(*) from company where " + str + temp;
									rs = cm.executeQuery(sql);
									rs.next();
									int i = rs.getInt(1);
									if (i==0)
									{
										list.add("<table width='100%' border='0' cellpadding='8' cellspacing='0' class='contentListTable'>" +
												"<tr bgcolor='#FFFFFF'><td bgcolor='#FFFFFF' width='110px'>"+year+"年"+month+"月新增客户</td>" +
												"<td align='lefp'>"+0+"个</td></tr></table>");
									}
									else
									{
										list.add("<table width='100%' border='0' cellpadding='8' cellspacing='0' class='contentListTable'>" +
												"<tr bgcolor='#FFFFFF'><td bgcolor='#FFFFFF' width='110px'>"+year+"年"+month+"月新增客户</td>" +
												"<td align='center' width='"+i/10+"px'><div style='height:10px;background:#ff0000;width:"+i/10+"px'></div></td><td align='lefp'>"+i+"个</td></tr></table><br/>");
									}
									++month;
								}
								++year;
							}
						}
						else if("3".equals(statType))
						{
							list.add("<h3>"+rs.getString("realname")+goDate.get(Calendar.YEAR)+"年"+(goDate.get(Calendar.MONTH)+1)+"月"+goDate.get(Calendar.DATE)+"日"+"--"+endDate.get(Calendar.YEAR)+"年"+(endDate.get(Calendar.MONTH)+1)+"月"+endDate.get(Calendar.DATE)+"日"+"期间日增量客户统计</h3>");
							int year = goDate.get(Calendar.YEAR);
							int month = (goDate.get(Calendar.MONTH)+1);
							int date = goDate.get(Calendar.DATE);
							int endmonth = 12;
							Calendar tempc = Calendar.getInstance();
							tempc.setTime(Date.valueOf(year +"-" + month + "-" + date));
							int enddate = tempc.getActualMinimum(Calendar.DATE);
							list.add("<tr class='contentListTd'>");
							while (year<=endDate.get(Calendar.YEAR))
							{
								if (year!=goDate.get(Calendar.YEAR))
								{
									month = 1;
								}
								if (year==endDate.get(Calendar.YEAR))
								{
									endmonth = (endDate.get(Calendar.MONTH)+1);
								}
								while (month <= endmonth)
								{
									if (month!=(goDate.get(Calendar.MONTH)+1))
									{
										date = 1;
									}
									if ((year==endDate.get(Calendar.YEAR))&&(month==(endDate.get(Calendar.MONTH)+1)))
									{
										enddate = endDate.get(Calendar.DATE);
									}
									while (date <= enddate)
									{
										temp = " and adddate = '" + (year+"-"+month+"-"+date)+"'"; 
										sql = "select count(*) from company where " + str + temp;
										rs = cm.executeQuery(sql);
										rs.next();
										int i = rs.getInt(1);
										if (i==0)
										{
											list.add("<table width='100%' border='0' cellpadding='8' cellspacing='0' class='contentListTable'>" +
													"<tr bgcolor='#FFFFFF'><td bgcolor='#FFFFFF' width='140px'>"+year+"年"+month+"月"+date+"日新增客户</td>" +
													"<td align='lefp'>"+0+"个</td></tr></table>");
										}
										else
										{
											list.add("<table width='100%' border='0' cellpadding='8' cellspacing='0' class='contentListTable'>" +
													"<tr bgcolor='#FFFFFF'><td bgcolor='#FFFFFF' width='140px'>"+year+"年"+month+"月"+date+"日新增客户</td>" +
													"<td align='center' width='"+i+"px'><div style='height:10px;background:#ff0000;width:"+i+"px'></div></td><td align='lefp'>"+i+"个</td></tr></table><br/>");
										}
										++date;
									}
									++month;
								}
								++year;
							}
						}
						request.setAttribute("list", list);
					}
					else
					{
						// 开始拼装SQL
						if (!"".equals(dept))
						{
							// 这一段SQL是统计与查询通用的
							sql = "select * from dept where deptid = " + dept;
							rs = cm.executeQuery(sql);
							rs.next();
							str = str + " addPersonnel in (select personnelid from personnel where deptid = " + dept + " and outdate is null)";
							if ("1".equals(statType))
							{	
								list.add("<h3>"+rs.getString("deptname")+goDate.get(Calendar.YEAR)+"年"+endDate.get(Calendar.YEAR)+"年"+"期间年增量客户统计</h3>");
								int year = goDate.get(Calendar.YEAR);
								while (year<=endDate.get(Calendar.YEAR))
								{
									temp = " and adddate in (select adddate from company where adddate >= '" + 
									(year+"-"+1+"-"+1) + 
									"' and adddate <= '" + (year +"-" + 12 + "-" + 31) + "')";
									sql = "select count(*) from company where " + str + temp;
									rs = cm.executeQuery(sql);
									rs.next();
									int i = rs.getInt(1);
									if (i==0)
									{
										list.add("<table width='100%' border='0' cellpadding='8' cellspacing='0' class='contentListTable'>" +
												"<tr bgcolor='#FFFFFF'><td bgcolor='#FFFFFF' width='90px'>"+year+"年新增客户</td>" +
												"<td align='lefp'>"+0+"个</td></tr></table>");
									}
									else
									{
										list.add("<table width='100%' border='0' cellpadding='8' cellspacing='0' class='contentListTable'>" +
												"<tr bgcolor='#FFFFFF'><td bgcolor='#FFFFFF' width='90px'>"+year+"年新增客户</td>" +
												"<td align='center' width='"+i/100+"px'><div style='height:10px;background:#ff0000;width:"+i/100+"px'></div></td><td align='lefp'>"+i+"个</td></tr></table><br/>");
									}
									++year;
								}
							}
							else if("2".equals(statType))
							{
								list.add("<h3>"+rs.getString("deptname")+goDate.get(Calendar.YEAR)+"年"+(goDate.get(Calendar.MONTH)+1)+"月--"+endDate.get(Calendar.YEAR)+"年"+(endDate.get(Calendar.MONTH)+1)+"月"+"期间月增量客户统计</h3>");
								int year = goDate.get(Calendar.YEAR);
								int month = (goDate.get(Calendar.MONTH)+1);
								int endmonth = 12;
								Calendar tempc = Calendar.getInstance();
								while (year<=endDate.get(Calendar.YEAR))
								{
									if (year!=goDate.get(Calendar.YEAR))
									{
										month = 1;
									}
									if (year==endDate.get(Calendar.YEAR))
									{
										endmonth = (endDate.get(Calendar.MONTH)+1);
									}
									while (month <= endmonth)
									{
										tempc.setTime(Date.valueOf(year +"-" + month + "-" + 1));
										temp = " and adddate in (select adddate from company where adddate >= '" + 
										(year+"-"+month+"-"+1) + 
										"' and adddate <= '" + (year +"-" + month + "-" + tempc.getActualMaximum(Calendar.DATE)) + "')";
										sql = "select count(*) from company where " + str + temp;
										rs = cm.executeQuery(sql);
										rs.next();
										int i = rs.getInt(1);
										if (i==0)
										{
											list.add("<table width='100%' border='0' cellpadding='8' cellspacing='0' class='contentListTable'>" +
													"<tr bgcolor='#FFFFFF'><td bgcolor='#FFFFFF' width='110px'>"+year+"年"+month+"月新增客户</td>" +
													"<td align='lefp'>"+0+"个</td></tr></table>");
										}
										else
										{
											list.add("<table width='100%' border='0' cellpadding='8' cellspacing='0' class='contentListTable'>" +
													"<tr bgcolor='#FFFFFF'><td bgcolor='#FFFFFF' width='110px'>"+year+"年"+month+"月新增客户</td>" +
													"<td align='center' width='"+i/10+"px'><div style='height:10px;background:#ff0000;width:"+i/10+"px'></div></td><td align='lefp'>"+i+"个</td></tr></table><br/>");
										}
										++month;
									}
									++year;
								}
							}
							else if("3".equals(statType))
							{
								list.add("<h3>"+rs.getString("deptname")+goDate.get(Calendar.YEAR)+"年"+(goDate.get(Calendar.MONTH)+1)+"月"+goDate.get(Calendar.DATE)+"日"+"--"+endDate.get(Calendar.YEAR)+"年"+(endDate.get(Calendar.MONTH)+1)+"月"+endDate.get(Calendar.DATE)+"日"+"期间日增量客户统计</h3>");
								int year = goDate.get(Calendar.YEAR);
								int month = (goDate.get(Calendar.MONTH)+1);
								int date = goDate.get(Calendar.DATE);
								int endmonth = 12;
								Calendar tempc = Calendar.getInstance();
								tempc.setTime(Date.valueOf(year +"-" + month + "-" + date));
								int enddate = tempc.getActualMinimum(Calendar.DATE);
								list.add("<tr class='contentListTd'>");
								while (year<=endDate.get(Calendar.YEAR))
								{
									if (year!=goDate.get(Calendar.YEAR))
									{
										month = 1;
									}
									if (year==endDate.get(Calendar.YEAR))
									{
										endmonth = (endDate.get(Calendar.MONTH)+1);
									}
									while (month <= endmonth)
									{
										if (month!=(goDate.get(Calendar.MONTH)+1))
										{
											date = 1;
										}
										if ((year==endDate.get(Calendar.YEAR))&&(month==(endDate.get(Calendar.MONTH)+1)))
										{
											enddate = endDate.get(Calendar.DATE);
										}
										while (date <= enddate)
										{
											temp = " and adddate = '" + (year+"-"+month+"-"+date)+"'"; 
											sql = "select count(*) from company where " + str + temp;
											rs = cm.executeQuery(sql);
											rs.next();
											int i = rs.getInt(1);
											if (i==0)
											{
												list.add("<table width='100%' border='0' cellpadding='8' cellspacing='0' class='contentListTable'>" +
														"<tr bgcolor='#FFFFFF'><td bgcolor='#FFFFFF' width='140px'>"+year+"年"+month+"月"+date+"日新增客户</td>" +
														"<td align='lefp'>"+0+"个</td></tr></table>");
											}
											else
											{
												list.add("<table width='100%' border='0' cellpadding='8' cellspacing='0' class='contentListTable'>" +
														"<tr bgcolor='#FFFFFF'><td bgcolor='#FFFFFF' width='140px'>"+year+"年"+month+"月"+date+"日新增客户</td>" +
														"<td align='center' width='"+i+"px'><div style='height:10px;background:#ff0000;width:"+i+"px'></div></td><td align='lefp'>"+i+"个</td></tr></table>");
											}
											++date;
										}
										++month;
									}
									++year;
								}
							}
							request.setAttribute("list", list);
						}
						else
						{
							// 开始拼装SQL
							// 这一段SQL是统计与查询通用的
							if(request.getSession().getAttribute("pos")!=null)
							{
								str = str + "personnelid in (select personnelid from personnel where outdate is null and deptid in (select deptid from dept where gradeid = " + ((Personnel) request.getSession().getAttribute("user")).getDept().getGradeid() + " and CHARINDEX('"+request.getSession().getAttribute("pos")+"',deptname)>0))";
							}
							else
							{
								str = str + "personnelid in (select personnelid from personnel where outdate is null and deptid in (select deptid from dept where gradeid = " + ((Personnel) request.getSession().getAttribute("user")).getDept().getGradeid() + "))";
							}
							if ("1".equals(statType))
							{	
								if(request.getSession().getAttribute("pos")!=null)
								{
									list.add("<h3>分公司"+request.getSession().getAttribute("pos")+"部"+goDate.get(Calendar.YEAR)+"年"+endDate.get(Calendar.YEAR)+"年"+"期间年增量客户统计</h3>");
								}
								else
								{
									list.add("<h3>分公司"+goDate.get(Calendar.YEAR)+"年"+endDate.get(Calendar.YEAR)+"年"+"期间年增量客户统计</h3>");
								}
								int year = goDate.get(Calendar.YEAR);
								while (year<=endDate.get(Calendar.YEAR))
								{
									temp = " and adddate in (select adddate from company where adddate >= '" + 
									(year+"-"+1+"-"+1) + 
									"' and adddate <= '" + (year +"-" + 12 + "-" + 31) + "')";
									sql = "select count(*) from company where " + str + temp;
									rs = cm.executeQuery(sql);
									rs.next();
									int i = rs.getInt(1);
									if (i==0)
									{
										list.add("<table width='100%' border='0' cellpadding='8' cellspacing='0' class='contentListTable'>" +
												"<tr bgcolor='#FFFFFF'><td bgcolor='#FFFFFF' width='90px'>"+year+"年新增客户</td>" +
												"<td align='lefp'>"+0+"个</td></tr></table>");
									}
									else
									{
										list.add("<table width='100%' border='0' cellpadding='8' cellspacing='0' class='contentListTable'>" +
												"<tr bgcolor='#FFFFFF'><td bgcolor='#FFFFFF' width='90px'>"+year+"年新增客户</td>" +
												"<td align='center' width='"+i/100+"px'><div style='height:10px;background:#ff0000;width:"+i/100+"px'></div></td><td align='lefp'>"+i+"个</td></tr></table>");
									}
									++year;
								}
							}
							else if("2".equals(statType))
							{
								if(request.getSession().getAttribute("pos")!=null)
								{
									list.add("<h3>分公司"+request.getSession().getAttribute("pos")+"部"+goDate.get(Calendar.YEAR)+"年"+(goDate.get(Calendar.MONTH)+1)+"月--"+endDate.get(Calendar.YEAR)+"年"+(endDate.get(Calendar.MONTH)+1)+"月"+"期间月增量客户统计</h3>");
								}
								else
								{
									list.add("<h3>分公司"+goDate.get(Calendar.YEAR)+"年"+(goDate.get(Calendar.MONTH)+1)+"月--"+endDate.get(Calendar.YEAR)+"年"+(endDate.get(Calendar.MONTH)+1)+"月"+"期间月增量客户统计</h3>");
								}
								int year = goDate.get(Calendar.YEAR);
								int month = (goDate.get(Calendar.MONTH)+1);
								int endmonth = 12;
								Calendar tempc = Calendar.getInstance();
								while (year<=endDate.get(Calendar.YEAR))
								{
									if (year!=goDate.get(Calendar.YEAR))
									{
										month = 1;
									}
									if (year==endDate.get(Calendar.YEAR))
									{
										endmonth = (endDate.get(Calendar.MONTH)+1);
									}
									while (month <= endmonth)
									{
										tempc.setTime(Date.valueOf(year +"-" + month + "-" + 1));
										temp = " and adddate in (select adddate from company where adddate >= '" + 
										(year+"-"+month+"-"+1) + 
										"' and adddate <= '" + (year +"-" + month + "-" + tempc.getActualMaximum(Calendar.DATE)) + "')";
										sql = "select count(*) from company where " + str + temp;
										rs = cm.executeQuery(sql);
										rs.next();
										int i = rs.getInt(1);
										if (i==0)
										{
											list.add("<table width='100%' border='0' cellpadding='8' cellspacing='0' class='contentListTable'>" +
													"<tr bgcolor='#FFFFFF'><td bgcolor='#FFFFFF' width='110px'>"+year+"年"+month+"月新增客户</td>" +
													"<td align='lefp'>"+0+"个</td></tr></table>");
										}
										else
										{
											list.add("<table width='100%' border='0' cellpadding='8' cellspacing='0' class='contentListTable'>" +
													"<tr bgcolor='#FFFFFF'><td bgcolor='#FFFFFF' width='110px'>"+year+"年"+month+"月新增客户</td>" +
													"<td align='center' width='"+i/10+"px'><div style='height:10px;background:#ff0000;width:"+i/10+"px'></div></td><td align='lefp'>"+i+"个</td></tr></table>");
										}
										++month;
									}
									++year;
								}
							}
							else if("3".equals(statType))
							{
								if(request.getSession().getAttribute("pos")!=null)
								{
									list.add("<h3>分公司"+request.getSession().getAttribute("pos")+"部"+goDate.get(Calendar.YEAR)+"年"+(goDate.get(Calendar.MONTH)+1)+"月"+goDate.get(Calendar.DATE)+"日"+"--"+endDate.get(Calendar.YEAR)+"年"+(endDate.get(Calendar.MONTH)+1)+"月"+endDate.get(Calendar.DATE)+"日"+"期间日增量客户统计</h3>");
								}
								else
								{
									list.add("<h3>分公司"+goDate.get(Calendar.YEAR)+"年"+(goDate.get(Calendar.MONTH)+1)+"月"+goDate.get(Calendar.DATE)+"日"+"--"+endDate.get(Calendar.YEAR)+"年"+(endDate.get(Calendar.MONTH)+1)+"月"+endDate.get(Calendar.DATE)+"日"+"期间日增量客户统计</h3>");
								}
								int year = goDate.get(Calendar.YEAR);
								int month = (goDate.get(Calendar.MONTH)+1);
								int date = goDate.get(Calendar.DATE);
								int endmonth = 12;
								Calendar tempc = Calendar.getInstance();
								tempc.setTime(Date.valueOf(year +"-" + month + "-" + date));
								int enddate = tempc.getActualMinimum(Calendar.DATE);
								list.add("<tr class='contentListTd'>");
								while (year<=endDate.get(Calendar.YEAR))
								{
									if (year!=goDate.get(Calendar.YEAR))
									{
										month = 1;
									}
									if (year==endDate.get(Calendar.YEAR))
									{
										endmonth = (endDate.get(Calendar.MONTH)+1);
									}
									while (month <= endmonth)
									{
										if (month!=(goDate.get(Calendar.MONTH)+1))
										{
											date = 1;
										}
										if ((year==endDate.get(Calendar.YEAR))&&(month==(endDate.get(Calendar.MONTH)+1)))
										{
											enddate = endDate.get(Calendar.DATE);
										}
										while (date <= enddate)
										{
											temp = " and adddate = '" + (year+"-"+month+"-"+date)+"'"; 
											sql = "select count(*) from company where " + str + temp;
											rs = cm.executeQuery(sql);
											rs.next();
											int i = rs.getInt(1);
											if (i==0)
											{
												list.add("<table width='100%' border='0' cellpadding='8' cellspacing='0' class='contentListTable'>" +
														"<tr bgcolor='#FFFFFF'><td bgcolor='#FFFFFF' width='140px'>"+year+"年"+month+"月"+date+"日新增客户</td>" +
														"<td align='lefp'>"+0+"个</td></tr></table>");
											}
											else
											{
												list.add("<table width='100%' border='0' cellpadding='8' cellspacing='0' class='contentListTable'>" +
														"<tr bgcolor='#FFFFFF'><td bgcolor='#FFFFFF' width='140px'>"+year+"年"+month+"月"+date+"日新增客户</td>" +
														"<td align='center' width='"+i+"px'><div style='height:10px;background:#ff0000;width:"+i+"px'></div></td><td align='lefp'>"+i+"个</td></tr></table>");
											}
											++date;
										}
										++month;
									}
									++year;
								}
							}
							request.setAttribute("list", list);
						}
					}
				}
				catch(SQLException e)
				{
					e.printStackTrace();
				}
			}
			else
			{
				request.setAttribute("error", "系统故障，请重试或联系管理员");
				request.getRequestDispatcher("/error.jsp").forward(request, response);
			}
		}
		finally
		{
			cm.close();
		}
		rd.forward(request, response);
	}
}
