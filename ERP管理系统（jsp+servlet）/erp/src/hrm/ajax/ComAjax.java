package hrm.ajax;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.dao.bean.Dept;

@SuppressWarnings("serial")
public class ComAjax extends HttpServlet
{

	@SuppressWarnings("unchecked")
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		Integer a=Integer.valueOf(request.getParameter("com"));
		List list = (List)request.getSession().getServletContext().getAttribute("dept");
		String backtrack ="";
		for (int i = 0; i < list.size(); i++)
		{
			Dept dept = (Dept)list.get(i);
			if (dept.getDeptid().equals(a))
			{
				List<Dept> li = dept.getDepts();
				for(int j = 0;j<li.size();j++)
				{
					Dept temp = li.get(j);
					backtrack = backtrack+"<option value="+temp.getDeptid()+" >"+temp.getDeptname()+"</option>";
				}
				
			}
		}
		response.getWriter().println(backtrack);
	}

}
