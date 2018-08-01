package test.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.service.BookServiceImpl;
import test.service.CatagoryServiceImpl;
import test.vo.BookInfo;
import test.vo.CatagoryInfo;

public class UpdateBookInfo extends HttpServlet {

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	
		String bookInfo = req.getParameter("bookInfo");
		BookServiceImpl bookServiceImpl = new BookServiceImpl();
		BookInfo bookgoryInfo = bookServiceImpl
				.searchBooks(Integer.parseInt(bookInfo));
		//req.setAttribute("bookinfo", bookinfo);
		req.getRequestDispatcher("index.jsp?page=updatebookinfo.jsp")
				.forward(req, resp);

		
		
		
		
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		doGet(req, resp);	
	}

	
}
