package com.xdf.exams.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xdf.exams.bean.Teacher;

public class RightFilter implements Filter{

	public void destroy() {
	}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse)resp;
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		uri = uri.substring(ctx.length());
		//������
		if(request.getSession().getAttribute("examinglist")!=null) {
			if((uri.endsWith(".do")||uri.endsWith(".jsp")||uri.equals("/"))&&!uri.equals("/student/exam/go.do")&&!uri.equals("/student/exam/end.do")) {
				request.setAttribute("message","���ڿ����벻Ҫ��������ҳ��!");
				request.getRequestDispatcher("/student/exam/go.do").forward(request,response);
				return;
			}
		}
		
		if(uri.startsWith("/student")) {
			if(request.getSession().getAttribute("student")==null) {
				request.setAttribute("message","��û�е�½");
				request.getRequestDispatcher("/index.jsp").forward(req,resp);
				return;
			}
		}
		if(uri.startsWith("/teacher")) {
			if(request.getSession().getAttribute("teacher")==null) {
				request.setAttribute("message","��û�е�½");
				request.getRequestDispatcher("/index.jsp").forward(req,resp);
				return;
			}
			if(uri.endsWith("/delete.do")||uri.endsWith("/updatedo.do")
					||uri.endsWith("/deletequestion.do")||uri.endsWith("/updatequestiondo.do")
					) {
						Teacher t = (Teacher)request.getSession().getAttribute("teacher");
						if(!t.getUsername().equals("admin")) {
							request.setAttribute("message","��û��ɾ�����޸ĵ�Ȩ��");
							request.getRequestDispatcher("/teacher/message.jsp").forward(req,resp);
							return;
						}			
					}			
		}		
		if(uri.startsWith("/teacher/admin")) {
			Teacher t = (Teacher)request.getSession().getAttribute("teacher");
			if(!t.getUsername().equals("admin")) {
				request.setAttribute("message","��û���޸Ľ�ʦ��Ȩ��");
				request.getRequestDispatcher("/teacher/message.jsp").forward(req,resp);
				return;
			}
		}
		chain.doFilter(req,resp);
	}

	public void init(FilterConfig config) throws ServletException {
	}
}
