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
package web.struts;

import java.lang.reflect.*;
import java.sql.ResultSet;

/**
 * 结果集合的接管，用于处理字符集的转码
 * @author Winter Lau
 */
class _ResultSet implements InvocationHandler {

	private final static Class[] infs = new Class[]{ResultSet.class};

	public _ResultSet(ResultSet rs, boolean decode) {
		this.rs = rs;
		this.decode = decode;
	}

	/**
	 * 获取ResultSet的代理
	 * @return
	 */
	public ResultSet getResultSet() {
		return (ResultSet)Proxy.newProxyInstance(
			rs.getClass().getClassLoader(), infs, this);
	}

	public Object invoke(Object proxy, Method m, Object args[])	throws Throwable 
	{
		String method = m.getName();
		if (decode && GETSTRING.equals(method))
			try {
				String result = (String) m.invoke(rs, args);
				if (result != null)
					return new String(result.getBytes("8859_1"));
				else
					return null;
			} catch (InvocationTargetException e) {
				throw e.getTargetException();
			}
		try {
			return m.invoke(rs, args);
		} catch (InvocationTargetException e) {
			throw e.getTargetException();
		}
	}

	private ResultSet rs;

	private boolean decode;

	private static final String GETSTRING = "getString";
}