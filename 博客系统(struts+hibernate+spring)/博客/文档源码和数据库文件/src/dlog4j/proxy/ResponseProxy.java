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
package dlog4j.proxy;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;


/**
 * 接管HttpServletResponse
 * 该代理类屏蔽了setContentType方法，这样在页面设置contentType就无效了。
 * @author liudong
 */
public class ResponseProxy implements InvocationHandler
{
	private ServletResponse response;
	
	private final static String SET_CONTENT_TYPE = "setContentType";
	private final static String ENCODE_URL = "encodeURL";

	/**
	 * 获取代理实例
	 * @param servlet
	 * @param request
	 * @return
	 * @throws ServletException
	 */
	public static ResponseProxy getProxy(ServletResponse response) throws ServletException
	{
		return new ResponseProxy(response);
	}
	
	private ResponseProxy(ServletResponse response)
	{
		this.response = response;
	}

	/* (non-Javadoc)
	 * @see java.lang.reflect.InvocationHandler#invoke(java.lang.Object, java.lang.reflect.Method, java.lang.Object[])
	 */
	public Object invoke(Object proxy, Method m, Object[] args) throws Throwable
	{
		//调用相应的操作
		Object obj = null;
		if(SET_CONTENT_TYPE.equals(m.getName()))
			return null;
		if(ENCODE_URL.equals(m.getName()))
			return args[0];
		try{
			obj = m.invoke(response, args);
		}catch(InvocationTargetException e){
			throw e.getTargetException(); 
		}
		return obj;
	}

	/* (non-Javadoc)
	 * @see ibibio.goweb.http.ObjectProxy#getInstance()
	 */
	public HttpServletResponse getInstance(){
		return (HttpServletResponse)Proxy.newProxyInstance(
				response.getClass().getClassLoader(),
				response_cls,
				this);
	}

	final static Class[] response_cls = new Class[]{HttpServletResponse.class};

}