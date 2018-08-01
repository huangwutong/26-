package test.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.service.UserinfoServiceImpl;
import test.vo.Userinfo;

public class RegistUserinfo extends HttpServlet {


	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		UserinfoServiceImpl impl = new UserinfoServiceImpl();

		List<Userinfo> list = impl.checkUname(req.getParameter("uname"));
		
		if (list.size() > 0) {
			req.setAttribute("uname", req.getParameter("uname"));
			req.setAttribute("message",
					"<font color=red>用户名已经存在请换一个用户名注册</font>");
			req.getRequestDispatcher("index.jsp?page=userRegist.jsp").forward(
					req, resp);
		} else {
			Userinfo userinfo = new Userinfo();
			userinfo.setUname(req.getParameter("uname"));
			userinfo.setPasswd(req.getParameter("passwd"));
			userinfo.setUsex(req.getParameter("usex"));
			userinfo.setUinterest(req.getParameter("uinterest"));
			userinfo.setEmail(req.getParameter("usermail"));
			userinfo.setAddress(req.getParameter("address"));
			userinfo.setTelephone(req.getParameter("telephone"));
			userinfo.setCity(req.getParameter("city"));
			impl.registUserinfo(userinfo);
			req.getRequestDispatcher("index.jsp").forward(req, resp);
		}

	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
}
