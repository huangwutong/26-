package com.anhuiU.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anhuiU.dao.MessagesDao;
import com.anhuiU.model.Messages;

public class MessageServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public MessageServlet() {
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
		
		MessagesDao md=new MessagesDao();
		
		String action =request.getParameter("action");
		
		if(action.equals("delete")){
			String id[]=request.getParameterValues("ids");
			int ids[]=new int[id.length];
			for (int i = 0; i < id.length; i++) {
				ids[i]=new Integer(id[i]);
			}
			
			md.delete(ids);
			List list=md.select();
			request.setAttribute("messages", list);
			
			request.getRequestDispatcher("../admin/message.jsp").forward(request, response);
		}
		
		if(action.equals("select")){
			List list=md.select();
			request.setAttribute("messages", list);
			
			request.getRequestDispatcher("../admin/message.jsp").forward(request, response);
		}
		
	  if(action.equals("insert")){
		 Messages m=new Messages();
		 String topic=request.getParameter("type");
		 if(topic.equals("1")){
			 m.setType("news");
		 }
		 else if(topic.equals("2")){
			 m.setType("hot");
			
		 }
		 else{
			 
			 m.setType("cc");
		 }
		
		 m.setContent(request.getParameter("content"));
		 m.setTopic(request.getParameter("topic"));
		 md.add(m);
		 List list=md.select();
		request.setAttribute("messages", list);
			
	    request.getRequestDispatcher("../admin/message.jsp").forward(request, response);
	  }
	  
	  
	  if(action.equals("selectById")){
		  int id=new Integer(request.getParameter("id"));
		  Messages m=new Messages();
		  m=md.selectById(id);
		  request.setAttribute("m", m);
		  request.getRequestDispatcher("../admin/messageInfo.jsp").forward(request, response);
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
