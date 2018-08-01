package crm.filiale;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.dao.bean.Dept;
import sys.dao.bean.Personnel;

@SuppressWarnings("serial")
public class DeptAjax extends HttpServlet
{

	@SuppressWarnings("unchecked")
	@Override
	//选择了部门后，得到这个部门的员工
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		Integer a=Integer.valueOf(request.getParameter("deptid"));
		List<Dept> list = ((Personnel)request.getSession().getAttribute("user")).getDept().getGrade().getDepts();
		String backtrack ="";
		for (int i = 0; i < list.size(); i++)
		{
			Dept dept = list.get(i);
			if (dept.getDeptid().equals(a))
			{
				List<Personnel> per = dept.getPersonnels();
				for(int j = 0;j<per.size();j++)
				{
					Personnel temp = per.get(j);
					if (temp.getOutdate()==null)
					{
						backtrack = backtrack+"<option value="+temp.getPersonnelid()+" >"+temp.getRealname()+"</option>";
					}
				}
				
			}
		}
		response.getWriter().println(backtrack);
	}
}
