package ad.ajax;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.dao.ConnectManager;
import sys.dao.bean.Industry;
import sys.dao.bean.Sort;

@SuppressWarnings("serial")
public class Sorts extends HttpServlet
{

	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		Integer a = Integer.valueOf(request.getParameter("a"));
		Industry industry = new Industry();
		ConnectManager cm = ConnectManager.newInstance();
		if (cm.getConnection())
		{
			String sql = "select * from industry where industryid = " + a;
			ResultSet rs = cm.executeQuery(sql);
			try
			{
				if (rs.next())
				{
					industry.setIndustryid(rs.getInt("industryid"));
					industry.setIndustry(rs.getString("industry"));
					industry.setIslock(rs.getByte("islock"));
				}
			}
			catch (SQLException e)
			{
				e.printStackTrace();
			}
			finally
			{
				cm.close();
			}
		}
		String backtrack = "";
		List<Sort> sorts = industry.getSorts();
		if (sorts != null)
		{
			for (int j = 0; j < sorts.size(); j++)
			{
				Sort temp = sorts.get(j);
				backtrack = backtrack + "<option value=" + temp.getSortId() + " >" + temp.getSortName() + "</option>";
			}
		}
		response.getWriter().println(backtrack);
	}
}
