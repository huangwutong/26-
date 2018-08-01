package test.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.service.OrderServiceImpl;
public class UpdateOrderServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request,response);
	}
 	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			response.setContentType("text/html;charset=GB2312");
			request.setCharacterEncoding("GB2312");
			int orderID=Integer.parseInt(request.getParameter("orderID"));
			String page="index.jsp?page=ordersList.jsp";
			if(new OrderServiceImpl().UpdateObject(orderID)){
				List l=new OrderServiceImpl().getAllOrders();
				if(l!=null){
					request.setAttribute("orders",l);					 
				}else{
					page="index.jsp";
				}
			} 
		request.getRequestDispatcher(page).forward(request,response);
	}
}

