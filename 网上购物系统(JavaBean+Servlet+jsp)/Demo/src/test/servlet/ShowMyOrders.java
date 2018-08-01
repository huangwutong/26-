package test.servlet;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import test.service.OrderServiceImpl;
import test.vo.Order;
import test.vo.Userinfo;

public class ShowMyOrders extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	doPost(request,response);
}
public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	
	
	int userno = ((Userinfo)request.getSession().getAttribute("userinfo")).getUserno();
	
	
	List l=new OrderServiceImpl().getAllOrdersByuserID(userno);
	
	if(l!=null){
		request.setAttribute("orders",l);
		request.getRequestDispatcher("index.jsp?page=myOrders.jsp")
.forward(request,response);
	}else{
		request.getRequestDispatcher("index.jsp").forward(request,response);
	}
}
}
