package crm.manager;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.dao.ConnectManager;
import sys.dao.bean.Personnel;

public class Aim extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	//制定本部门的本月目标
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		RequestDispatcher rd = null;
//		Date date = Date.valueOf(DateFormat.getDateInstance(DateFormat.DEFAULT).format(new java.util.Date()));
//		Calendar calendar = Calendar.getInstance();
//		calendar.setTime(date);
//		if (calendar.get(Calendar.DAY_OF_MONTH) == 1)
//		{
			String aim = request.getParameter("aim").replace(" ", "");
			int dept = ((Personnel) request.getSession().getAttribute("user")).getDeptid();
			String sql = "update dept set moneyaim = " + aim + " where deptid = " + dept;
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					cm.executeUpdate(sql);
					request.setAttribute("success", "本月目标制定成功!祝你完成目标!");
					rd = request.getRequestDispatcher("/succ.jsp");
				}
				finally
				{
					cm.close();
				}
			}
			else
			{
				request.setAttribute("error", "系统故障，请重试或联系管理员");
				rd = request.getRequestDispatcher("/error.jsp");
			}
//		}
//		else
//		{
//			request.setAttribute("error", "今天不是一号不可以设定目标");
//			rd = request.getRequestDispatcher("/error.jsp");
//		}
		rd.forward(request, response);
	}
}
