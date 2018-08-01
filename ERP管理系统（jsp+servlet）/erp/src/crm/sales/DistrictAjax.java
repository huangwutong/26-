package crm.sales;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.dao.bean.District;

@SuppressWarnings("serial")
public class DistrictAjax extends HttpServlet
{

	@SuppressWarnings("unchecked")
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		
		Integer a=Integer.valueOf(request.getParameter("a"));
		List list = (List)request.getSession().getServletContext().getAttribute("district");
		String backtrack ="";
		for (int i = 0; i < list.size(); i++)
		{
			District district = (District)list.get(i);
			if (district.getDistrictid().equals(a))
			{
				List<District> li = district.getDistricts();
				for(int j = 0;j<li.size();j++)
				{
					District temp = (District)li.get(j);
					backtrack = backtrack+"<option value="+temp.getDistrictid()+" >"+temp.getDistrict()+"</option>";
				}
				
			}
		}
		response.getWriter().println(backtrack);
	}

}
