package com.anhuiU.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anhuiU.dao.MessagesDao;
import com.anhuiU.dao.UserDao;
import com.anhuiU.model.User;

public class LoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
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
		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		
		
		String name=request.getParameter("userName");
		String pwd=request.getParameter("pwd");
		String code=request.getParameter("code");
		
		String rand=request.getSession().getAttribute("rand").toString();
		
		UserDao ud=new UserDao();
		User user=   ud.checkPwd(name);
		if(!code.equals(rand)){
			response.sendRedirect("../error.jsp");
		}
		
		else if(!pwd.equals(user.getPassword())){
			response.sendRedirect("../error2.jsp");
		}
		else{
			
			request.getSession().setAttribute("user", user);
			
			response.sendRedirect("../index.jsp");
		}
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
