package sys.servlet;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.dao.bean.Personnel;

public class Login extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		if (request.getParameter("validate") != null)
		{
			String val = request.getParameter("validate").replace(" ", "");
			String rend = request.getSession().getAttribute("rand").toString();
			if (rend.equals(val))
			{
				request.getSession().removeAttribute("rand");
				if (request.getSession().getAttribute("user") != null)
				{
					if (request.getSession().getAttribute("pwd") != null)
					{
						if (Boolean.valueOf(request.getSession().getAttribute("pwd").toString()))
						{
							request.getSession().removeAttribute("pwd");
							List<String> list = new ArrayList<String>();
							List<String> mylist = new ArrayList<String>();
							List<String> syslist = new ArrayList<String>();
							List<String> alist = new ArrayList<String>();
							Personnel per = (Personnel) request.getSession().getAttribute("user");
							request.getSession().setAttribute("date", Date.valueOf(DateFormat.getDateInstance(DateFormat.DEFAULT).format(new java.util.Date())));
							String str = per.getDept().getDeptname();
							String pos = per.getPosition().getJob();
							response.getWriter().println(str+pos);
							if (str.indexOf("人事") >= 0)
							{
								request.setAttribute("menu1", "员工管理");
								list.add("<a href='turn?type=ap' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;增加新员工</a>");
								list.add("<a href='selectPersonnel' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;员工列表</a>");
								request.setAttribute("menu3", "系统设置");
								syslist.add("<a href='page/editpwd.jsp' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;修改密码</a>");
							}
							else if (((str.indexOf("招商") >= 0) || (str.indexOf("广告") >= 0)) && (pos.indexOf("普通员工") >= 0))
							{
								request.setAttribute("menu1", "公共客户管理");
								list.add("<a href='selectC' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公共客户列表</a>");
								list.add("<a href='clear' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;搜索公共客户</a>");
								request.setAttribute("menu2", "我的客户管理");
								mylist.add("<a href='chick' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;添加新客户</a>");
								mylist.add("<a href='selectA' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A类客户列表</a>");
								mylist.add("<a href='select' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B类客户列表</a>");
								mylist.add("<a href='clearab' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;搜索我的客户</a>");
								mylist.add("<a href='attorning' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;转让中的客户</a>");
								mylist.add("<a href='incepting' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;接收中的客户</a>");
								if (str.indexOf("招商") >= 0)
								{
									request.getSession().setAttribute("d", 1);
								}
								else
								{
									request.getSession().setAttribute("d", 0);
								}
								if (str.indexOf("广告") >= 0)
								{
									mylist.add("<a href='turn?type=bill' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;广告位查询</a>");
								}
								request.setAttribute("menu3", "系统设置");
								syslist.add("<a href='page/editpwd.jsp' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;修改密码</a>");
							}
							else if (((str.indexOf("招商") >= 0) || (str.indexOf("广告") >= 0)) && (pos.indexOf("部门经理") >= 0))
							{
								request.setAttribute("menu4", "部门客户管理");
								alist.add("<a href='turn?type=mc' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;查询客户</a>");
								alist.add("<a href='turn?type=vl' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;查询拜访</a>");
								alist.add("<a href='dstatistic' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;客户统计</a>");
								alist.add("<a href='turn?type=aim' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;制定本月目标</a>");
								request.setAttribute("menu1", "公共客户管理");
								list.add("<a href='selectC' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公共客户列表</a>");
								list.add("<a href='clear' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;搜索公共客户</a>");
								request.setAttribute("menu2", "我的客户管理");
								mylist.add("<a href='chick' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;添加新客户</a>");
								mylist.add("<a href='selectA' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A类客户列表</a>");
								mylist.add("<a href='select' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B类客户列表</a>");
								mylist.add("<a href='clearab' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;搜索我的客户</a>");
								mylist.add("<a href='attorning' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;转让中的客户</a>");
								mylist.add("<a href='incepting' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;接收中的客户</a>");
								if (str.indexOf("招商") >= 0)
								{
									request.getSession().setAttribute("d", 1);
								}
								else
								{
									request.getSession().setAttribute("d", 0);
								}
								if (str.indexOf("广告") >= 0)
								{
									mylist.add("<a href='turn?type=bill' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;广告位查询</a>");
								}
								request.setAttribute("menu3", "系统设置");
								syslist.add("<a href='page/editpwd.jsp' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;修改密码</a>");
							}
							else if (pos.indexOf("分公司经理") >= 0)
							{
								request.setAttribute("menu4", "分公司客户管理");
								alist.add( "<a href='fCompany' target='main'>查询客户</a>");
								alist.add( "<a href='turn?type=fvl' target='main'>查询拜访</a>");
								alist.add( "<a href='saim' target='main'>查询目标</a>");
								alist.add( "<a href='turn?type=fst' target='main'>增量客户统计</a>");
								request.setAttribute("menu1", "公共客户管理");
								list.add("<a href='fcList' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公共客户列表</a>");
								list.add("<a href='turn?type=fsc' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;搜索公共客户</a>");
								request.setAttribute("menu3", "系统设置");
								syslist.add( "<a href='page/editpwd.jsp' target='main'>修改密码</a>");
							}
							else if((pos.indexOf("总监")>=0)&&(str.indexOf("广告") >= 0))
							{
								request.getSession().setAttribute("pos", "广告");
								request.setAttribute("menu4", "广告部客户管理");
								alist.add( "<a href='fCompany' target='main'>查询客户</a>");
								alist.add( "<a href='turn?type=fvl' target='main'>查询拜访</a>");
								alist.add( "<a href='turn?type=fst' target='main'>增量客户统计</a>");
								request.setAttribute("menu1", "公共客户管理");
								list.add("<a href='fcList' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公共客户列表</a>");
								list.add("<a href='turn?type=fsc' target='main'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;搜索公共客户</a>");
								request.setAttribute("menu3", "系统设置");
								syslist.add( "<a href='page/editpwd.jsp' target='main'>修改密码</a>");
							}
							else if(str.indexOf("市场") >= 0)
							{
								request.getSession().setAttribute("pos", "广告");
								request.setAttribute("menu4", "广告位管理");
								alist.add( "<a href='turn?type=addSort' target='main'>添加子页面</a>");
								alist.add("<a href='turn?type=addBill' target='main'>广告位管理</a>");
								request.setAttribute("menu3", "系统设置");
								syslist.add( "<a href='page/editpwd.jsp' target='main'>修改密码</a>");
							}
							request.setAttribute("menu", list);
							request.setAttribute("mymenu", mylist);
							request.setAttribute("sysmenu", syslist);
							request.setAttribute("amenu", alist);
							Calendar cal = Calendar.getInstance();
							request.setAttribute("da", cal.getActualMaximum(Calendar.DATE) - cal.get(Calendar.DATE));
							RequestDispatcher rd = request.getRequestDispatcher("/page/index.jsp");
							rd.forward(request, response);
						}
					}
					else
					{
						request.setAttribute("error", "请正确的输入你的用户名与密码");
						request.getRequestDispatcher("/login.jsp").forward(request, response);
					}
				}
				else
				{
					request.setAttribute("error", "请正确的输入你的用户名与密码");
					request.getRequestDispatcher("/login.jsp").forward(request, response);
				}
			}
			else
			{
				request.setAttribute("error", "验证码不正确");
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}
		}
		else
		{
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}
}
