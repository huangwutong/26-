package test.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.service.BookServiceImpl;
import test.vo.BookInfo;

public class AddBookInfo extends HttpServlet {

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		BookInfo bookInfo = new BookInfo();
		bookInfo.setCrono(Integer.parseInt(req.getParameter("crono")));
		bookInfo.setAuthor(req.getParameter("author"));
		bookInfo.setBname(req.getParameter("bname"));
		bookInfo.setPdate(req.getParameter("pdate"));
		bookInfo.setPublisher(req.getParameter("publisher"));
		bookInfo.setRemark(req.getParameter("remark"));
		bookInfo.setPrice(Float.parseFloat(req.getParameter("price")));
		
		BookServiceImpl bookServiceImpl = new BookServiceImpl();
		if(!bookServiceImpl.addBookInfo(bookInfo))
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
