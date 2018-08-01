package test.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.service.UserinfoServiceImpl;
import test.vo.Userinfo;

public class CheckUnameServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String uname = new String(req.getParameter("uname").getBytes("iso8859-1"),"utf-8");
		UserinfoServiceImpl impl = new UserinfoServiceImpl();
		List<Userinfo> list = impl.checkUname(uname);
		if(list.size()>0)
		{
			req.setAttribute("uname", uname);
			req.setAttribute("message", "<font color=red>�û����Ѿ������뻻һ���û���ע��</font>");
			req.getRequestDispatcher("index.jsp?page=userRegist.jsp").forward(req, resp);
		}
		else
		{
			req.setAttribute("uname", uname);
			req.setAttribute("message", "<font color=blue>��ϲ���û�����δʹ�ã�</font>");
			req.getRequestDispatcher("index.jsp?page=userRegist.jsp").forward(req, resp);
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
}
