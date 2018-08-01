package crm.filiale;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.dao.bean.Dept;
import sys.dao.bean.Personnel;

public class SAim extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	//查询每个部门的业绩
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		List<Dept> depts = ((Personnel) request.getSession().getAttribute("user")).getDept().getGrade().getDepts();
		List<String> user = new ArrayList<String>();
		int money = 0;
		for (Dept dept : depts)
		{
			if (!((Personnel) request.getSession().getAttribute("user")).getDeptid().equals(dept.getDeptid()))
			{
				user.add(dept.getDeptname()+"的目标:"+dept.getMoneyaim());
				money+=dept.getMoneyaim();
			}
		}
		request.setAttribute("all","分公司本月的总目标："+money+"万");
		request.setAttribute("user",user);
		request.getRequestDispatcher("crm/manager/dstatistic.jsp").forward(request, response);
	}
}
