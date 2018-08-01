package com.accp.myoa.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.omg.CORBA.Request;

public class EncodingFilter implements Filter {
	private String encoding=null;
	
	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding(encoding);
		response.setContentType(encoding);
		chain.doFilter(request, response);
	}

	public void init(FilterConfig config) throws ServletException {
		encoding=config.getInitParameter("encoding");
		if (encoding==null) {
			encoding="utf-8";
		}

	}

}
