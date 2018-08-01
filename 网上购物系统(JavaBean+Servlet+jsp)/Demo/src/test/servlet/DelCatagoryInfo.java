package test.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.service.CatagoryServiceImpl;

public class DelCatagoryInfo extends HttpServlet {

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		CatagoryServiceImpl catagoryServiceImpl = new CatagoryServiceImpl();
		if(!catagoryServiceImpl.delCatagoryInfo(Integer.parseInt(req.getParameter("catano"))))
		{
			req.getRequestDispatcher("index.jsp?page=catagoryinfo.jsp").forward(req, resp);
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
