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

import java.sql.*;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import org.apache.struts.Globals;
import org.apache.struts.action.ActionForm;

/**
 * Formbean类的扩展
 * @author Winter Lau
 */
public abstract class ActionFormExtend extends ActionForm {

	/**
	 * 获取到默认数据库的连接
	 * @return
	 * @throws SQLException
	 */
	protected Connection getConnection() throws SQLException {
		ServletContext context = servlet.getServletContext();
		DataSource dataSource = (DataSource) context
				.getAttribute(Globals.DATA_SOURCE_KEY);
		return dataSource.getConnection();
	}

	/**
	 * 获取到指定数据库的连接
	 * @return
	 * @throws SQLException
	 */
	protected Connection getConnection(String key) throws SQLException {
		ServletContext context = servlet.getServletContext();
		DataSource dataSource = (DataSource) context.getAttribute(key);
		return dataSource.getConnection();
	}

	/**
	 * 释放数据库资料
	 * @param rs
	 * @param stmt
	 * @param conn
	 */
	protected void close(ResultSet rs, Statement stmt, Connection conn) {
		if (rs != null)
			try {
				rs.close();
			} catch (Exception exception) {
			}
		if (stmt != null)
			try {
				stmt.close();
			} catch (Exception exception1) {
			}
		if (conn != null)
			try {
				conn.close();
			} catch (Exception exception2) {
			}
	}
}