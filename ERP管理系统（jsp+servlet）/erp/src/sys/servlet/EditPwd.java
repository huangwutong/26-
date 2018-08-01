package sys.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.cls.MD5;
import sys.dao.ConnectManager;
import sys.dao.bean.Personnel;

public class EditPwd extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		RequestDispatcher rd = request.getRequestDispatcher("/succ.jsp");
		String oldpwd = request.getParameter("oldpwd");
		if (user.getPassword().equals(MD5.md5(oldpwd)))
		{
			String sql = "update personnel set password = '" + MD5.md5(request.getParameter("newpwd")) + "' where personnelid = " + user.getPersonnelid();
			ConnectManager cm = ConnectManager.newInstance();
			if (cm.getConnection())
			{
				try
				{
					cm.executeUpdate(sql);
					request.setAttribute("success", "密码修改成功了");
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
		}
		else
		{
			request.setAttribute("error", "旧密码不正确");
			rd = request.getRequestDispatcher("/error.jsp");
		}
		rd.forward(request, response);

	}
}
