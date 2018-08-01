package filter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.*;
//import dao.AccessBean;

import po.Toperator;

/**
 * @author 赵昌峻
 * 
 * TODO 判断用户是否是管理员
 */
public class SecondFilter implements Filter {

	public void init(FilterConfig cong) {
//		do nothing
	}

	public void doFilter(ServletRequest srequest, ServletResponse sresponse,
			FilterChain chain) {

		try {
			HttpServletRequest requst = (HttpServletRequest) srequest;
			HttpServletResponse response = (HttpServletResponse) sresponse;
			HttpSession session = requst.getSession();
			//从session中取得操作员
			Toperator operator = (Toperator) session.getAttribute("operator");
			String ad=operator.getIsAdmin().toString();
			//如果是普通业务员,则无此操作权限
			if (operator == null || ad.equals("0")) {
				
					response.sendRedirect("/chinamobile/web/main.jsp");
				
			} else {
				chain.doFilter(srequest, sresponse);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void destroy() {
		//do nothing
	}

}