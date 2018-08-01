package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.service.AdminServiceImpl;
import test.vo.AdminInfo;

public class AdminLogin extends HttpServlet {


	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		 HttpSession session=req.getSession();
		
	        String randomCode=(String)session.getAttribute("randomCode");
	      
	        if(null==randomCode)
	        {
	            resp.sendRedirect("index.jsp?page=administer.jsp");
	            return;
	        }
	        
	        String reqRandom=req.getParameter("random");
	        
	        req.setCharacterEncoding("GBK");
	        resp.setContentType("text/html;charset=GBK");
	        PrintWriter out=resp.getWriter();
	        
	        if(randomCode.equals(reqRandom))
	        {
	            
	        	AdminInfo adminInfo = new AdminInfo();
	    		adminInfo.setAdmin_name(req.getParameter("adminName"));
	    		adminInfo.setAdmin_password(req.getParameter("adminPass"));
	    		AdminServiceImpl adminServiceImpl = new AdminServiceImpl();
	    		List<AdminInfo> list = adminServiceImpl.getAdmin(adminInfo);
	    		
	    		if(list.size()>0)
	    		{
	    			HttpSession httpSession = req.getSession();
	    			
	    			httpSession.setAttribute("struts",5);
	    			httpSession.setAttribute("user", "管理员："+adminInfo.getAdmin_name());
	    			req.getRequestDispatcher("index.jsp?page=manage.jsp").forward(req, resp);
	    		}else
	    		{
	    		req.setAttribute("error", "<font color=red>管理员登录不正确，请重新登录！</font>");
	    		req.getRequestDispatcher("index.jsp?page=administer.jsp").forward(req, resp);
	    		}
	        }
	        else
	        {
	        	req.setAttribute("error", "<font color=red >验证错误!</font>");
	        	req.getRequestDispatcher("index.jsp?page=administer.jsp").forward(req, resp);
	        }
		
		
		
		
	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
}
