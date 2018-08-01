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

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.*;
import java.util.Enumeration;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts.Globals;
import org.apache.struts.action.*;

/**
 * ʵ�����¼�ӳ����չ
 * 
 * @author Winter Lau
 */
public abstract class ActionExtend extends Action {

	/**
	 * Action��ִ�����
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) throws Exception {
		String param = null;
		String value = null;
		for (Enumeration enum = req.getParameterNames(); enum.hasMoreElements();) {
			String t_param = (String) enum.nextElement();
			if (t_param.startsWith(SUBMIT_BUTTON_PREFIX)) {
				value = req.getParameter(t_param);
				param = METHOD_PREFIX + t_param.substring(SUBMIT_BUTTON_PREFIX.length());
				break;
			}
		}

		if (param == null)
			param = "doDefault";
		try{
			return callActionMethod(mapping, form, req, res, param, value);
		}catch(InvocationTargetException e){
			throw (Exception)e.getCause();
		}
	}

	/**
	 * �����¼�������
	 * @param mapping
	 * @param form
	 * @param req
	 * @param res
	 * @param methodName
	 * @param value
	 * @return
	 * @throws Exception
	 */
	protected ActionForward callActionMethod(ActionMapping mapping,
			ActionForm form, HttpServletRequest req, HttpServletResponse res,
			String methodName, String value) throws Exception {
		Method doMethod = null;
		Object params[] = (Object[]) null;
		for (int i = 0; i < methodParams.length;)
			try {
				doMethod = getClass().getDeclaredMethod(methodName,methodParams[i]);
				if (doMethod.getParameterTypes().length == 4){
					params = (new Object[] { mapping, form, req, res });
					break;
				}
				if (doMethod.getParameterTypes().length != 5)
					continue;
				params = new Object[]{mapping,form,req,res,value};
				break;
			} catch (NoSuchMethodException excp) {
				i++;
			}

		if (doMethod != null) {
			if (paramMapping(doMethod.getName()))
				BeanUtils.populate(this, req.getParameterMap());
			Object ret = doMethod.invoke(this, params);
			if (doMethod.getReturnType().equals(ActionForward.class))
				return (ActionForward) ret;
			if (doMethod.getReturnType().equals(String.class))
				return new ActionForward((String) ret);
		}
		return null;
	}

	/**
	 * ��ȡ��Ĭ�����ݿ������
	 * 
	 * @return
	 * @throws SQLException
	 */
	protected Connection getConnection() throws SQLException {
		ServletContext context = servlet.getServletContext();
		DataSource ds = (DataSource)context.getAttribute(Globals.DATA_SOURCE_KEY);
		return ds.getConnection();
	}

	/**
	 * ��ȡ��ָ�����ݿ������
	 * 
	 * @return
	 * @throws SQLException
	 */
	protected Connection getConnection(String key) throws SQLException {
		ServletContext context = servlet.getServletContext();
		DataSource ds = (DataSource) context.getAttribute(key);
		return ds.getConnection();
	}

	/**
	 * �ͷ����ݿ���Դ
	 * 
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

	/**
	 * �����Ƿ񽫱�����ӳ�䵽Action���������
	 * ������Ը��Ǹ÷����������Զ�ӳ�书��
	 * ���黹��ʹ��Struts��Formbean���������ģʽ
	 * @param method
	 * @return
	 */
	protected boolean paramMapping(String method) {
		return false;
	}

	public static void main(String args[]) {
		for (int i = 0; i < methodParams.length; i++) {
			for (int j = 0; j < methodParams[i].length; j++)
				System.out.print(methodParams[i][j].getName() + "\t");

			System.out.println();
		}

	}

	public static final String SUBMIT_BUTTON_PREFIX = "eventSubmit_";

	public static final String METHOD_PREFIX = "do";

	private static final Class method1Params[];

	private static final Class method2Params[];

	private static final Class method3Params[];

	private static final Class method4Params[];

	private static final Class methodParams[][];
	static {
		method1Params = (new Class[] {
				org.apache.struts.action.ActionMapping.class,
				org.apache.struts.action.ActionForm.class,
				javax.servlet.ServletRequest.class,
				javax.servlet.ServletResponse.class });
		method2Params = (new Class[] {
				org.apache.struts.action.ActionMapping.class,
				org.apache.struts.action.ActionForm.class,
				javax.servlet.ServletRequest.class,
				javax.servlet.ServletResponse.class, java.lang.String.class });
		method3Params = (new Class[] {
				org.apache.struts.action.ActionMapping.class,
				org.apache.struts.action.ActionForm.class,
				javax.servlet.http.HttpServletRequest.class,
				javax.servlet.http.HttpServletResponse.class });
		method4Params = (new Class[] {
				org.apache.struts.action.ActionMapping.class,
				org.apache.struts.action.ActionForm.class,
				javax.servlet.http.HttpServletRequest.class,
				javax.servlet.http.HttpServletResponse.class,
				java.lang.String.class });
		methodParams = (new Class[][] { method1Params, method2Params,
				method3Params, method4Params });
	}
}