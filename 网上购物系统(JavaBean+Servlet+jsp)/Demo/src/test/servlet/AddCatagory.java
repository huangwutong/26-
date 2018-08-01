package test.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.service.CatagoryServiceImpl;
import test.vo.CatagoryInfo;

public class AddCatagory extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		CatagoryInfo catagoryInfo = new CatagoryInfo();
		catagoryInfo.setCname(req.getParameter("cataName"));
		catagoryInfo.setXeplain(req.getParameter("cataContent"));
		CatagoryServiceImpl catagoryServiceImpl = new CatagoryServiceImpl();
		if(catagoryServiceImpl.saveCatagory(catagoryInfo)!=null)
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
