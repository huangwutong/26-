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

import java.io.Serializable;
import java.lang.reflect.*;
import java.sql.Connection;
import javax.sql.DataSource;

/**
 * 数据源对象的接管，由于Struts本身使用的是dbcp连接池
 * 此类就是接管DataSource接口
 * @author Winter Lau
 */
class _DataSource implements InvocationHandler, Serializable {

	private final static Class[] infs = new Class[]{DataSource.class};
	
	public _DataSource(DataSource ds, boolean encoding) {
		dataSource = ds;
		this.encoding = encoding;
	}

	/**
	 * 获取DataSource的代理
	 * @return
	 */
	public DataSource getDataSource() {
		return (DataSource) Proxy.newProxyInstance(
			dataSource.getClass().getClassLoader(), infs, this);
	}

	public Object invoke(Object proxy, Method m, Object args[])	throws Throwable 
	{
		if (METHOD_NAME.equals(m.getName())){
			try {
				Connection conn = (Connection) m.invoke(dataSource, args);
				return (conn==null)?null:(new _Connection(conn,encoding)).getConnection();
			} catch (InvocationTargetException e) {
				throw e.getTargetException();
			}
		}
		try {
			return m.invoke(dataSource, args);
		} catch (InvocationTargetException e) {
			throw e.getTargetException();
		}
	}

	private DataSource dataSource;

	private boolean encoding;

	private final static String METHOD_NAME = "getConnection";
}