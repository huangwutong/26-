package control.web;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import control.ExceptionHandler;
import control.DataBaseConnector;

public class Login extends HttpServlet {
	private RequestDispatcher rd = null;
	private Connection con = null;
	private DataBaseConnector db = null;
	private static final String message = "登陆失败";
	/**
	 * 
	 * @处理登录请求
	 */
	public void init(ServletConfig config)throws ServletException{
		super.init(config);
		db = new DataBaseConnector();
	}
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String action = action = req.getParameter("action");
		HttpSession session =req.getSession(true);
		if("attempt".equals(action)){
			String queryuser = "select UserName from UserInfo where UserName=? and UserPassword=?";
			String username = validateUser(req,resp,queryuser,1);
			try{
				if(username==null){
					throw new ExceptionHandler("帐号密码错误,请重新输入");
				}
			}catch(ExceptionHandler e){
				doError(req,resp,message,e);
				return;
			}
			session.setAttribute("username",username);
			resp.sendRedirect(req.getContextPath()+"/index.jsp");
			return;
		}
		if("adminlogin".equalsIgnoreCase(action)){
			String queryadmin = "select AdminName from AdminInfo where AdminName=? and AdminPassword=?";
			String adminname = validateUser(req,resp,queryadmin,2);
			session.setAttribute("adminname",adminname);
			resp.sendRedirect(req.getContextPath()+"/admin/index.jsp");
			return;
		}
		if("logout".equals(action)){
			session.invalidate();
			resp.sendRedirect(req.getContextPath()+"/index.jsp");
			return;
		}
	}
	/**
	*检查用户输入是否符合要求
	 * @throws ExceptionHandler 
	*/
	public boolean isAccord(HttpServletRequest req, HttpServletResponse resp,
            String username,String password)
            throws ServletException, IOException{
	    boolean accord = true;                     	
	    String message ="";
	    try{
	    	if(username==null){
		    	accord = false;
			    message="用户名不能为空,请重新填写";
			    throw new ExceptionHandler("登陆失败");
			
		    }
			if(password==null){
				accord = false;
				message="密码不能为空，请重新填写！";
				throw new ExceptionHandler("登陆失败");
			}
	    }catch(ExceptionHandler e){
	    	doError(req,resp,message,e);
	    }
	    
		return accord;
	}
	/**
	 * 验证用户
	 */
	public String validateUser(HttpServletRequest req,HttpServletResponse resp,
								String query,int state)
	  throws ServletException,IOException{
		PreparedStatement pst = null;
		String username = "";
		String password = "";
		if(state==1){//普通用户
			username = req.getParameter("username").trim();
			password = req.getParameter("password").trim();
		}else{//管理员
			username = req.getParameter("adminname").trim();
			password = req.getParameter("adminpassword").trim();
		}try{
			if(isAccord(req,resp,username,password)){
				con = db.getConnection();
				pst = con.prepareStatement(query);
				pst.setString(1,username);
				pst.setString(2,password);
				ResultSet rs = pst.executeQuery();
				if(rs.next()){
					username = rs.getString(1);
				}else{
					username= null;
				}
			}
			con.close();
		}catch(SQLException e){
			doError(req,resp,message,e);
			}
		return username;
	}
	/**
	*错误处理
	*/
	public void doError(HttpServletRequest req,
			HttpServletResponse resp,String message,Exception e)
	    throws ServletException,IOException {
        req.setAttribute("error", message+"<br/>"+e.getMessage()); 
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/errorpage.jsp"); 
        rd.forward(req,resp);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
}
