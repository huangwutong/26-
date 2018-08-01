/*
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Library General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */
package dlog4j;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import dlog4j.proxy.ResponseProxy;

/**
 * 用来设置contentType的过滤器
 * 该过滤器目前用于/blog/下的几个页面 atom.jsp, rss1.jsp, rss2.jsp
 * 主要是让<xml version="1.0"> 这行位于文件的第一行
 * @author Winter Lau
 */
public class ContentTypeFilter implements Filter {
	
	protected String contentType = "text/html;charset=UTF-8";

	public void init(FilterConfig config) throws ServletException {
		String ct = config.getInitParameter("contentType");
		if(ct!=null && ct.trim().length()>0)
			contentType = ct;
	}

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		res.setContentType(contentType);
		HttpServletResponse p_res = ResponseProxy.getProxy(res).getInstance();
		chain.doFilter(req, p_res);
	}

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#destroy()
	 */
	public void destroy() {
	}

}
