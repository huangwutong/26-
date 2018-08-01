package com.anhuiU.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.jspsmart.upload.File;
import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import com.anhuiU.dao.RoomDao;
import com.anhuiU.model.Rooms;

public class RoomServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	private   ServletConfig   s_config;   
	public RoomServlet() {
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
		SmartUpload smartUpload=new SmartUpload();
		
		
		RoomDao rd=new  RoomDao();
		
			Rooms r=new Rooms();
			
			
			
			File file=smartUpload.getFiles().getFile(0);
			String imageName=System.nanoTime()+"."+file.getFileExt();
			try {
				smartUpload.upload();
				Request request1=smartUpload.getRequest();
				r.setRoomType(new Integer(request1.getParameter("roomType")));
				r.setNum(request1.getParameter("num"));
				r.setState("ø’œ–");
				r.setRoomPrice(new Double(request1.getParameter("pirce")));
			    String path = request.getContextPath();
		        path+="\\image"+imageName;
		    
				file.saveAs(path);
				System.out.println(path);
				r.setImg(path);
				rd.add(r);
			} catch (SmartUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.getRequestDispatcher("../admin/room.jsp").forward(request, response);
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init(ServletConfig   config) throws ServletException {
		// Put your code here
		super.init(config);
		this.s_config=config;
	}

}
