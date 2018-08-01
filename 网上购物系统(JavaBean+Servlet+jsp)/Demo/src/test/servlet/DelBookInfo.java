package test.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.service.BookServiceImpl;

public class DelBookInfo extends HttpServlet{


	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		BookServiceImpl bookServiceImpl = new BookServiceImpl();
		
	
		if(!bookServiceImpl.delBookInfo(Integer.parseInt(req.getParameter("bookno"))))
		{
			req.getRequestDispatcher("index.jsp?page=bookinfo.jsp").forward(req, resp);
		}
		else {
			req.getRequestDispatcher("index.jsp?page=error.jsp").forward(req, resp);
		}
		
		
		
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		doGet(req, resp);
	}

	
}
