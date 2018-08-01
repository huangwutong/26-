package com.xdf.exams.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;


public class EncodingFilter implements Filter{

	public void destroy() {
	}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest)req;
		//设置请求中文
		request.setCharacterEncoding("GBK");
		//继续处理
		chain.doFilter(req,resp);
	}

	public void init(FilterConfig config) throws ServletException {
	}

}
