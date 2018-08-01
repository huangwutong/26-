package sys.filter;

import java.io.IOException;

import javax.servlet.*;

public class EncodingFilter implements Filter
{

	public void destroy()
	{

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException
	{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		chain.doFilter(request, response);
	}

	public void init(FilterConfig arg0) throws ServletException
	{

	}

}
