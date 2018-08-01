package test.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.service.BookServiceImpl;
import test.vo.BookInfo;
import test.vo.CartItem;

public class AddCartServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Map cart = (Map) session.getAttribute("cartInfo");
		if (cart == null)
			cart = new HashMap();

		String bookno = request.getParameter("bookno");
		String crono = request.getParameter("crono");

		CartItem ci = null;
		BookInfo bookInfo = new BookInfo();
		if (bookno != null) {
			bookInfo = new BookServiceImpl().getOneBookBybookID(Integer
					.parseInt(bookno));
			
			
			
			if (cart.containsKey(bookno)) {
				CartItem temp = (CartItem) cart.get(bookno);
				cart.remove(bookno);
				ci = new CartItem(bookInfo, temp.getNum() + 1);
			} else {
				ci = new CartItem(bookInfo, 1);
			}
			cart.put(bookno, ci);

		}
		session.setAttribute("cartInfo", cart);
		
		request.getRequestDispatcher("pageShowCatagoryList").forward(request,
				response);
	}
}
