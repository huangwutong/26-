package test.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.service.CatagoryServiceImpl;
import test.vo.CatagoryInfo;

public class SaveUpdateCatagoryInfo extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		CatagoryInfo catagoryInfo = new CatagoryInfo(Integer.parseInt(req
				.getParameter("crono")), req.getParameter("cname"), req
				.getParameter("xeplain"));
		CatagoryServiceImpl catagoryServiceImpl = new CatagoryServiceImpl();
		Boolean result = catagoryServiceImpl.updateCatagoryInfo(catagoryInfo);
		if(result==false)
		{
			req.getRequestDispatcher("index.jsp?page=catagoryinfo.jsp").forward(req, resp);
		}else {
			req.setAttribute("error", "<font color=red>±£¥Ê ß∞‹</font>");
			req.getRequestDispatcher("index.jsp?page=error.jsp").forward(req, resp);
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
}
