package com.xh369.service;

import javax.servlet.*;
import javax.servlet.http.*;
import com.xh369.actions.HibernateSessionFactory;
import java.io.IOException;

public class CloseSessionFilter extends HttpServlet implements Filter{

    private FilterConfig filterConfig;

    //Handle the passed-in FilterConfig
    public void init(FilterConfig filterConfig) throws ServletException{
        this.filterConfig = filterConfig;
    }

    //Process the request/response pair
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException{

        try {
            filterChain.doFilter((HttpServletRequest) request, (HttpServletResponse) response);
        }finally{
            try {
                HibernateSessionFactory.commitTransaction();
            } catch (Exception ex) {
                ex.printStackTrace();
                HibernateSessionFactory.rollbackTransaction();
            }finally{
                HibernateSessionFactory.closeSession();
            }
        }
    }

    //Clean up resources
    public void destroy(){
    }
}
