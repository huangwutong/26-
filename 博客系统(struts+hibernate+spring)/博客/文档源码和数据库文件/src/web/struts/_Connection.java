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
import java.sql.*;

/**
 * 接管数据库连接，防止由于某些数据库不支持事务处理而抛出的异常
 * @author Winter Lau
 */
class _Connection implements InvocationHandler {
	
	private final static Class[] infs = new Class[]{Connection.class};

	_Connection(Connection conn, boolean coding) {
		this.conn = conn;
		this.coding = coding;
		DatabaseMetaData dm = null;
		try{
			dm = conn.getMetaData();
			supportTransaction = dm.supportsTransactions();
		}catch(Exception e){}
	}
	
	/**
	 * 获取对象的代理
	 * @return
	 */
	public Connection getConnection() {
		return (Connection)Proxy.newProxyInstance(
			conn.getClass().getClassLoader(),infs, this);
	}

	void close() throws SQLException {
		conn.close();
	}

	public Object invoke(Object proxy, Method m, Object args[])	throws Throwable 
	{
		String method = m.getName();
		if ((M_SETAUTOCOMMIT.equals(method) || 
			 M_COMMIT.equals(method) || 
			 M_ROLLBACK.equals(method))
			 && !isSupportTransaction())
			return null;
		Object obj = null;
		try {
			obj = m.invoke(conn, args);
			if (CREATESTATEMENT.equals(method)||PREPAREDSTATEMENT.equals(method))
				return (new _Statement((Statement) obj, coding)).getStatement();
		} catch (InvocationTargetException e) {
			throw e.getTargetException();
		}
		return obj;
	}

	public boolean isSupportTransaction() {
		return supportTransaction;
	}

	private Connection conn;

	private boolean supportTransaction;

	private boolean coding;

	private static final String PREPAREDSTATEMENT = "prepareStatement";

	private static final String CREATESTATEMENT = "createStatement";

	private static final String M_SETAUTOCOMMIT = "setAutoCommit";

	private static final String M_COMMIT = "commit";

	private static final String M_ROLLBACK = "rollback";
}