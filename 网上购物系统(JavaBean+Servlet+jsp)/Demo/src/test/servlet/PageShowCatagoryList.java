package test.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.service.CatagoryServiceImpl;
import test.vo.CatagoryInfo;

public class PageShowCatagoryList extends HttpServlet {

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int currentPage = 0;
		int totalPage = 0;
		if(req.getParameter("currentPage")!=null && req.getParameter("totalPage")!=null)
		{
			currentPage = Integer.parseInt(req.getParameter("currentPage"));
			totalPage = Integer.parseInt(req.getParameter("totalPage"));
		}else {
			CatagoryServiceImpl catagoryServiceImpl = new CatagoryServiceImpl();
			int temp = catagoryServiceImpl.getCatagorys().size();
			totalPage = (temp+4)/5;
		}
		
		CatagoryServiceImpl catagoryServiceImpl = new CatagoryServiceImpl();
		List<CatagoryInfo> list = catagoryServiceImpl.getPageCatagorys(currentPage);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("list", list);
		req.getRequestDispatcher("index.jsp?page=catagorylist.jsp").forward(req, resp);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}

	
	
}
