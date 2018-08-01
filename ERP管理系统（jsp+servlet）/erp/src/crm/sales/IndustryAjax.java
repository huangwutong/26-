package crm.sales;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.dao.bean.Industry;

@SuppressWarnings("serial")
public class IndustryAjax extends HttpServlet
{

	@SuppressWarnings("unchecked")
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		List list = null;
		if (request.getSession().getAttribute("d").equals("1"))
		{
			list = (List) request.getSession().getServletContext().getAttribute("industrys");
		}
		else
		{
			list = (List) request.getSession().getServletContext().getAttribute("industry");
		}
		String backtrack = "";
		for (int i = 0; i < list.size(); i++)
		{
			Industry industry = (Industry) list.get(i);
			backtrack = backtrack + "<option value=" + industry.getIndustryid() + " >" + industry.getIndustry() + "</option>";
		}
		response.getWriter().println(backtrack);
	}
}
