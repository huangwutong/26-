package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.vo.UserList;

public class ShowUser extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<String> userlist = new ArrayList<String>();
		UserList list = UserList.getInstance();
		 Enumeration<String> enums=list.getUserList();
         int i=0;
         while(enums.hasMoreElements())
         {
             userlist.add(enums.nextElement());
            i = i+1;
         }
         req.setAttribute("userlist", userlist);
         req.getSession().setAttribute("count", i);
         req.getRequestDispatcher("index.jsp?page=showUser.jsp").forward(req, resp);
        
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
}
