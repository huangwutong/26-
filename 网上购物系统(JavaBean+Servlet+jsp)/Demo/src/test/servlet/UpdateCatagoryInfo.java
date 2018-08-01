package test.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.service.CatagoryServiceImpl;
import test.vo.CatagoryInfo;

public class UpdateCatagoryInfo extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String catano = req.getParameter("catano");
		CatagoryServiceImpl catagoryServiceImpl = new CatagoryServiceImpl();
		CatagoryInfo catagoryInfo = catagoryServiceImpl
				.searchCatagoryInfo(Integer.parseInt(catano));
		req.setAttribute("catagoryinfo", catagoryInfo);
		req.getRequestDispatcher("index.jsp?page=updateCatagoryinfo.jsp")
				.forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
}
