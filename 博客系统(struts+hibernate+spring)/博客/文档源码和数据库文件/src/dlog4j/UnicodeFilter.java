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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dlog4j.proxy.RequestProxy;
import dlog4j.proxy.ResponseProxy;
import dlog4j.util.StringUtils;

/**
 * UNICODE¹ýÂËÆ÷
 * @author Winter Lau
 */
public class UnicodeFilter implements Filter {

	String encoding;
	
	/* (non-Javadoc)
	 * @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
	 */
	public void init(FilterConfig config) throws ServletException {	
		encoding = config.getInitParameter("encoding");
		if(StringUtils.isEmpty(encoding))
			encoding = "UTF-8";
		config.getServletContext().setAttribute("encoding", encoding);
	}

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, 
	 * 		javax.servlet.ServletResponse, 
	 * 		javax.servlet.FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse res,FilterChain chain) 
		throws IOException, ServletException 
	{	
		HttpServletRequest h_req = (HttpServletRequest)req;	
		HttpServletResponse response = (HttpServletResponse)res;	
		String accept = h_req.getHeader("accept");
		if(accept==null || accept.indexOf("text/vnd.wap.wml")==-1)
			res.setContentType("text/html;charset=UTF-8");
		else{
			response.setContentType("text/vnd.wap.wml;charset=UTF-8");
			response.setHeader("Pragma","No-cache");
			response.setHeader("Cache-Control","no-cache");
			response.setDateHeader("Expires", 0);
		}
		HttpServletRequest p_req = RequestProxy.getProxy(req, encoding).getInstance();
		HttpServletResponse p_res = ResponseProxy.getProxy(response).getInstance();
		chain.doFilter(p_req, p_res);
	}

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#destroy()
	 */
	public void destroy() {
	}

}
