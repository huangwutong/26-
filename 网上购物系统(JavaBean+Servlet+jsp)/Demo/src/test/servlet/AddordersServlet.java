package test.servlet;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.service.OrderServiceImpl;
import test.service.OrderdetailsServiceImpl;
import test.vo.CartItem;
import test.vo.Order;
import test.vo.Orderdetails;
import test.vo.Userinfo;
public class AddordersServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			Order o=new Order();
			Orderdetails od=new Orderdetails();
			HttpSession session=request.getSession();         
			Userinfo userinfo=(Userinfo)session.getAttribute("userinfo");
			Map map=(Map) session.getAttribute("cartInfo");
			String uname=userinfo.getUname();
			String address=userinfo.getAddress();
			String forward="";
			int userno=userinfo.getUserno();
			int status=0;
			Order order=new Order();
			o.setUname(uname);
			o.setUserno(userno);
			o.setStatus(status);
			List list=null;
			
			if((order=new OrderServiceImpl().SaveObject(o))!=null){
			
			session.setAttribute("order",order);
//为删除后重新从数据库里取数据时，提供orderID
			CartItem c=new CartItem();
            List l=c.getItemList(map);
			for(int i=0;i<l.size();i++){
				od=(Orderdetails)l.get(i);
				String bname=od.getBname();
				double price=od.getPrice();
				int num=od.getNum();
				od.setOrderno(order.getOrderno());
				od.setBname(bname);
				od.setPrice(price);
				od.setNum(num);
				
				if(new OrderdetailsServiceImpl().SaveObject(od)){
					list=new OrderdetailsServiceImpl().getAllOrderdetailsByoID(order.getOrderno());
					
					request.setAttribute("orderdetails",list);
					forward="index.jsp?page=showMyOrders";
				}else{
					System.out.println("create new orderdetails failed!");
forward="index.jsp?page=errors.jsp";
				}
			}
			}else{
				System.out.println("NO!");
			}
			session.setAttribute("cartInfo",null);
			request.getRequestDispatcher(forward).forward(request,response);
	}
}

