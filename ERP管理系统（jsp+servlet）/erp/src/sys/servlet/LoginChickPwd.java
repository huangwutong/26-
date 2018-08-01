package sys.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.cls.MD5;
import sys.dao.bean.Personnel;

public class LoginChickPwd extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int pwdInt = 0;
		if (request.getSession().getAttribute("pwdInt") != null)
		{
			pwdInt = new Integer(request.getSession().getAttribute("pwdInt").toString());
		}
		if (pwdInt < 3)
		{
			if (request.getSession().getAttribute("user") != null)
			{
				Personnel per = (Personnel) request.getSession().getAttribute("user");
				String pwd = request.getParameter("pwd").replace(" ", "");
				if (per.getPassword().equals(MD5.md5(pwd)))
				{
					request.getSession().setAttribute("pwd", Boolean.valueOf("true"));
					response.getWriter().print("yes");
				}
				else
				{
					request.getSession().setAttribute("pwdInt", ++pwdInt);
					response.getWriter().print("no");
				}
			}
			else
			{
				request.getSession().setAttribute("pwdInt", ++pwdInt);
				response.getWriter().print("warn");
			}
		}
		else
		{
			response.getWriter().print("out");
		}
	}
}
