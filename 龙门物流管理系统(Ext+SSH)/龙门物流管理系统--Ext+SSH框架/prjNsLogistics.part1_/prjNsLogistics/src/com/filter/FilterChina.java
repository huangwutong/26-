package com.filter;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

import org.springframework.context.ApplicationContext;

import com.service.OptBuService;

public class FilterChina extends HttpServlet implements Filter {

	//ÉùÃ÷Ë½ÓÐµÄOptBuService
	private OptBuService bus;
	
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		// TODO Auto-generated method stub	
		arg0.setCharacterEncoding("UTF-8");
		arg1.setCharacterEncoding("UTF-8");
		arg2.doFilter(arg0, arg1);
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

	public OptBuService getBus() {
		return bus;
	}

	public void setBus(OptBuService bus) {
		this.bus = bus;
	}

}
