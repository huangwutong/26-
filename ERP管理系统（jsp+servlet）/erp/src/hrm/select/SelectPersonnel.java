package hrm.select;

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
import sys.dao.bean.Dept;
import sys.dao.bean.Personnel;

public class SelectPersonnel extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	//遍历员工
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		boolean p = false;
		ConnectManager cm = ConnectManager.newInstance();
		Personnel user = (Personnel)request.getSession().getAttribute("user");
		RequestDispatcher rd = request.getRequestDispatcher("hrm/select/list.jsp");
		if (cm.getConnection())
		{
			List<Personnel> personnels = null;
			String sql = "";
			if (user.getDept().getGrade().getDeptid()==1)
			{
				sql = "select * from personnel where realname is not null";
			}
			else
			{
				List<Dept> depts = user.getDept().getGrade().getDepts();
				String temp = "";
				for (Dept dept:depts)
				{
					temp = temp+dept.getDeptid().toString()+",";
				}
				if (!"".endsWith(temp))
				{
					temp = (String)temp.substring(0,temp.lastIndexOf(","));
				}
				sql = "select * from personnel where realname is not null and deptid in ("+temp+")";
			}
			ResultSet rs = cm.executeQuery(sql);
			try
			{
				if (rs.next())
				{
					p = true;
					personnels = new ArrayList<Personnel>();
					do
					{
						Personnel personnel = new Personnel();
						personnel.setPersonnelid(rs.getInt("personnelid"));
						personnel.setRealname(rs.getString("realname"));
						personnel.setDeptid(rs.getInt("deptid"));
						personnel.setPositionid(rs.getInt("positionid"));
						personnel.setJobid(rs.getString("jobid"));
						personnel.setSex(rs.getByte("sex"));
						personnel.setBirthday(rs.getDate("birthday"));
						personnel.setNation(rs.getString("native"));
						personnel.setNation(rs.getString("nation"));
						personnel.setPolity(rs.getString("polity"));
						personnel.setWedlock(rs.getByte("wedlock"));
						personnel.setIdcardno(rs.getString("idcardno"));
						personnel.setIdcardaddress(rs.getString("idcardaddress"));
						personnel.setSocialinsuranceid(rs.getString("socialinsuranceid"));
						personnel.setFinishschool(rs.getString("finishschool"));
						personnel.setSpecialty(rs.getString("specialty"));
						personnel.setAcademic(rs.getString("academic"));
						personnel.setDwelling(rs.getString("dwelling"));
						personnel.setAdddate(rs.getDate("adddate"));
						personnel.setOutdate(rs.getDate("outdate"));
						personnel.setPassdate(rs.getDate("passdate"));
						personnel.setUsername(rs.getString("username"));
						personnel.setPassword(rs.getString("password"));
						personnel.setIslock(rs.getByte("islock"));
						personnel.setA(rs.getInt("A"));
						personnel.setB(rs.getInt("B"));
						personnels.add(personnel);
					}
					while (rs.next());
				}
				rs.close();
			}
			catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally
			{
				cm.close();
			}
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
				if(request.getAttribute("page")!=null)
				{
					page = new Integer(request.getAttribute("page").toString());
				}
				// 总页面数
				int pageCount = personnels.size() / pageSize + (personnels.size() % pageSize == 0 ? 0 : 1);
				request.setAttribute("csize", "员工数:"+personnels.size()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;总页数:"+pageCount);
				// 定位当前显示页的第一行
				int currentPageFirstRow = (page - 1) * pageSize;
				// 得到当前页的数据
				List<Personnel> pageRows = new ArrayList<Personnel>();
				for (int i = currentPageFirstRow; i < currentPageFirstRow + pageSize; i++)
				{
					if (i >= personnels.size())
					{
						break;
					}
					pageRows.add((Personnel) personnels.get(i));
				}
				// 设当前页的HTML游标
				String htmlPage = "";
				if (personnels.size() != 0)
				{

					if (page != 1)
					{
						htmlPage = htmlPage + "&nbsp;<a href='selectPersonnel?page=1' class='pagenum'>首页</a>";
						htmlPage = htmlPage + "&nbsp;<a href='selectPersonnel?page=" + (page - 1) + "' class='pagenum'>上一页</a>";
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
							htmlPage = htmlPage + "&nbsp;<a href='selectPersonnel?page=" + i + "' class='pagenum'>" + i + "</a>";
						}
						else
						{
							htmlPage = htmlPage + "&nbsp;" + i;
							request.setAttribute("size", i);
						}
					}
					if (page != pageCount)
					{
						htmlPage = htmlPage + "&nbsp;<a href='selectPersonnel?page=" + (page + 1) + "' class='pagenum'>下一页</a>";
						htmlPage = htmlPage + "&nbsp;<a href='selectPersonnel?page=" + (pageCount) + "' class='pagenum'>尾页</a>";
					}
				}
				request.setAttribute("htmlPage", htmlPage);
				request.setAttribute("pageRows", pageRows);
			}
			rd.forward(request, response);
		}
		else
		{
			request.setAttribute("error", "系统故障，请重试或联系管理员");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		this.doGet(request, response);
	}
}
