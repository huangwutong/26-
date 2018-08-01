package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.service.UserinfoServiceImpl;
import test.vo.UserList;
import test.vo.Userinfo;

public class UserLogin extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String uname = req.getParameter("uname");
		String passwd = req.getParameter("passwd");

		if (null == uname || null == passwd || uname.equals("")
				|| passwd.equals("")) {
			req.setAttribute("message", "<font color=red>用户名或密码输入为空！</font>");
			req.getRequestDispatcher("index.jsp").forward(req, resp);
		} else {
			
			UserinfoServiceImpl impl = new UserinfoServiceImpl();
			List<Userinfo> list = impl.getUserinfo(uname, passwd);
			
			if(list.size()>0)
			{
				
				HttpSession httpSession = req.getSession();
				httpSession.setAttribute("user", "用户："+uname);
				Userinfo userinfo = (Userinfo)req.getAttribute("userinfo");
				if(userinfo==null || !uname.equals(userinfo.getUname()))
				{
					Iterator<Userinfo> iterator = list.iterator();
					userinfo = iterator.next();					
					httpSession.setAttribute("userinfo", userinfo);
					
				}
				UserList ul = UserList.getInstance();
				httpSession.setAttribute("count", ul.getUserCount());
			
				req.getRequestDispatcher("index.jsp").forward(req, resp);
			}else {
				req.setAttribute("message", "<font color=red>登录不正确，请重新登录！</font>");
				req.getRequestDispatcher("index.jsp").forward(req, resp);
			}
			
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
}
