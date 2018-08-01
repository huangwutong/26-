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
 * ��������contentType�Ĺ�����
 * �ù�����Ŀǰ����/blog/�µļ���ҳ�� atom.jsp, rss1.jsp, rss2.jsp
 * ��Ҫ����<xml version="1.0"> ����λ���ļ��ĵ�һ��
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
