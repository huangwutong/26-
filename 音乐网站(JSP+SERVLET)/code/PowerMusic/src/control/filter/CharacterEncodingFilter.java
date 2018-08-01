package control.filter;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
/**
 * @用于转换请求字符编码的filter
 * 
 */
public class CharacterEncodingFilter implements Filter
{
	protected FilterConfig filterConfig = null;
	protected String encoding = "";
	
	public void init(FilterConfig filterConfig) throws ServletException
	{
		this.filterConfig = filterConfig;
		this.encoding = filterConfig.getInitParameter("encoding");
	}
	public void doFilter(final ServletRequest req,final ServletResponse
						resp, FilterChain chain) 
			throws IOException, ServletException
	{
		if(encoding != null)
			req.setCharacterEncoding(encoding);
		chain.doFilter(req, resp);
		return;
	}
	public void destroy()
	{
		filterConfig = null;
		encoding = null;
	}
	
}