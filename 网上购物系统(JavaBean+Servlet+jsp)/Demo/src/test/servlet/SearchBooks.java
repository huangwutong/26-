package test.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.service.BookServiceImpl;
import test.vo.BookInfo;

public class SearchBooks extends HttpServlet {

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		BookServiceImpl bookServiceImpl = new BookServiceImpl();
		List<BookInfo> list = bookServiceImpl.searchBooks(req.getParameter("bookname"));
		
		req.setAttribute("booklist", list);
		req.getRequestDispatcher("index.jsp?page=searchBooks.jsp").forward(req, resp);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
}
