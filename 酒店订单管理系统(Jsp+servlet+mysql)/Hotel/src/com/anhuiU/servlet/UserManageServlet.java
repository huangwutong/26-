
package com.anhuiU.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.print.attribute.standard.PDLOverrideSupported;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anhuiU.dao.UserDao;
import com.anhuiU.model.User;
import com.uitils.PageBean;
import com.uitils.PageBeanDao;

public class UserManageServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserManageServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		
	    String tbName="user";
		PageBeanDao pbd=new PageBeanDao();
		PageBean pbean=pbd.getPageRowSava(1,tbName);
		pbean.setSumPage(pbd.getCountPage(pbean.getSumSava()).getSumPage());
		UserDao ud=new UserDao();
		
		String action=request.getParameter("action");
		if(action.equals("select")){
			
			
			PageBean pb=pbd.getPageRowSava(pbean.getThisPage(),tbName);
			
			request.setAttribute("pb", pb);
			request.setAttribute("userList", pb.getMap());
			request.setAttribute("thisPage", pb.getThisPage());
			request.setAttribute("befPage",1);
			if(pbean.getSumPage()>1){
				request.setAttribute("nextPage", 2);
			}
			else{
				request.setAttribute("nextPage", 1);
			}
			RequestDispatcher rd=request.getRequestDispatcher("../admin/userManage.jsp");
			rd.forward(request, response);
		}
		if(action.equals("page")){
			int befPage=0,nextPage=0;
			int thisPage=new Integer(request.getParameter("page"));
			if(thisPage-1<=0){
				 thisPage=1;
				 befPage=1;
			}
			else{
				befPage=thisPage-1;
			}
			if(thisPage+1 >pbean.getSumPage()){
				thisPage=pbean.getSumPage();
				nextPage=pbean.getSumPage();
			}
			else {
				nextPage=thisPage+1;
			}
			PageBean pb=pbd.getPageRowSava(thisPage, tbName);
			request.setAttribute("pb", pb);
			request.setAttribute("userList", pb.getMap());
			request.setAttribute("thisPage", thisPage);
			request.setAttribute("befPage",befPage);
			request.setAttribute("nextPage", nextPage);
			RequestDispatcher rd=request.getRequestDispatcher("../admin/userManage.jsp");
			rd.forward(request, response);			
		}
		
		if(action.equals("selectById")){
			int id=new Integer(request.getParameter("id"));
			
			User user=ud.selectById(id);
			request.setAttribute("user", user);
			RequestDispatcher rd=request.getRequestDispatcher("../admin/userInfo.jsp");
			rd.forward(request, response);
			
		}
		
	  if(action.equals("delete")){
		  int id=new Integer(request.getParameter("id"));
		  ud.delete(id);
		  PageBean pb=pbd.getPageRowSava(pbean.getThisPage(),tbName);
			
			request.setAttribute("pb", pb);
			request.setAttribute("userList", pb.getMap());
			request.setAttribute("thisPage", pb.getThisPage());
			request.setAttribute("befPage",1);
			if(pbean.getSumPage()>1){
				request.setAttribute("nextPage", 2);
			}
			else{
				request.setAttribute("nextPage", 1);
			}
			RequestDispatcher rd=request.getRequestDispatcher("../admin/userManage.jsp");
			rd.forward(request, response);
	  }
		
	}

	/**
	 * Initialization of the servlet. 
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
