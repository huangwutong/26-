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
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;


/**
 * HttpServletRequest的代理
 * 用于进行参数编码的统一处理
 * @author liudong
 */
public class RequestProxy implements InvocationHandler
{
	final static String METHOD_GP  = "getParameter";
	final static String METHOD_GPM = "getParameterMap";
	final static String METHOD_GPN = "getParameterNames";
	final static String METHOD_GPV = "getParameterValues";	 
	
	final static String ENC_8859_1 = "8859_1";
	final static String ENC_UTF_8 = "UTF-8";
	
	protected String encoding;

	public String getEncoding() {
		return encoding;
	}
	public void setEncoding(String encoding) {
		this.encoding = encoding;
	}
	
	private ServletRequest req;		

	/**
	 * 获取代理实例
	 * @param servlet
	 * @param request
	 * @return
	 * @throws ServletException
	 */
	public final static RequestProxy getProxy(ServletRequest req, String encoding) throws ServletException{
		return new RequestProxy(req, encoding);
	}
	
	private RequestProxy(ServletRequest req, String encoding){
		this.req = req;
		this.encoding = encoding;
	}

	/* (non-Javadoc)
	 * @see java.lang.reflect.InvocationHandler#invoke(java.lang.Object, java.lang.reflect.Method, java.lang.Object[])
	 */
	public Object invoke(Object proxy, Method m, Object[] args) throws Throwable{
		//调用相应的操作
		Object obj = null;
		String encode = (encoding==null)?ENC_UTF_8:encoding;
		try{
			obj = m.invoke(req, args);
			if(obj!=null){
				String mn = m.getName();
				if(METHOD_GP.equals(mn)){
					String value = (String)obj;
					obj = new String(value.getBytes(ENC_8859_1),encode);
				}
				else
				if(METHOD_GPV.equals(mn)){
					String[] values = (String[])obj;
					for(int i=0;i<values.length;i++)
						values[i] = new String(values[i].getBytes(ENC_8859_1),encode);
					obj = values;
				}
				else
				if(METHOD_GPM.equals(mn)){
					Map params = (Map)obj;
					HashMap new_params = new HashMap();
					Iterator iter = params.keySet().iterator();
					while(iter.hasNext()){
						String key = (String)iter.next();
						Object oValue = params.get(key);
						if(oValue.getClass().isArray()){
							String[] values = (String[])params.get(key);
							for(int i=0;i<values.length;i++)
								values[i] = new String(values[i].getBytes(ENC_8859_1),encode);
							new_params.put(key, values);
						}
						else{
							String value = (String)params.get(key);
							String new_value = (value!=null)?
									new String(value.getBytes(ENC_8859_1),encode):null;
							new_params.put(key,new_value);
						}
					}
				}
			}
		}catch(InvocationTargetException e){
			throw e.getTargetException(); 
		}
		return obj;
	}

	/* (non-Javadoc)
	 * @see ibibio.goweb.http.ObjectProxy#getInstance()
	 */
	public HttpServletRequest getInstance(){		
		return (HttpServletRequest)Proxy.newProxyInstance(
				req.getClass().getClassLoader(),
				request_cls,
				this);
	}
	final static Class[] request_cls = new Class[]{HttpServletRequest.class};
}