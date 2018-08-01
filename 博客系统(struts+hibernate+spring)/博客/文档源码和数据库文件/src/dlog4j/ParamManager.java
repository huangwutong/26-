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
package dlog4j;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import dlog4j.formbean.ParamForm;
import dlog4j.formbean.SiteForm;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Session;
import net.sf.hibernate.expression.Expression;

/**
 * @author Liudong
 * 系统参数管理接口
 */
public class ParamManager {

	public final static String LOGS_PER_PAGE = "LOGS_PER_PAGE";
	
	/**
	 * 获取指定站点设定的每页显示的日记数
	 * @param ssn
	 * @param site
	 * @return
	 * @throws Exception
	 */
	public static int getLogPerPage(Session ssn, SiteForm site) throws Exception{
		return getIntParam(ssn,site,LOGS_PER_PAGE,5);
	}
	/**
	 * 列出某个站点的所有参数信息
	 * @param ssn
	 * @param site
	 * @return
	 * @throws HibernateException
	 */
	public static List listParams(Session ssn, SiteForm site)
		throws HibernateException {
		int siteid = (site != null) ? site.getId() : -1;
		return ssn
			.createCriteria(ParamForm.class)
			.add(Expression.eq("site.id", new Integer(siteid)))
			.list();
	}
	/**
	 * 获取整形参数
	 * @param ssn
	 * @param site
	 * @param param
	 * @param defValue
	 * @return
	 * @throws Exception
	 */
	public static ParamForm getParam(Session ssn, SiteForm site, String param)
		throws SQLException, HibernateException {
		int siteid = (site == null) ? 0 : site.getId();
		ParamForm p = null;
		List params =
			ssn
				.createCriteria(ParamForm.class)
				.add(Expression.eq("name", param))
				.add(Expression.eq("site.id", new Integer(siteid)))
				.list();
		if (params.size() > 0)
			p = (ParamForm) params.get(0);
		return p;
	}
	/**
	 * 获取整形参数值
	 * @param ssn
	 * @param site
	 * @param param
	 * @param defValue
	 * @return
	 * @throws Exception
	 */
	public static int getIntParam(
		Session ssn,
		SiteForm site,
		String param,
		int defValue)
		throws SQLException, HibernateException  {
		ParamForm p = getParam(ssn, site, param);
		if (p == null
			|| p.getValue() == null
			|| p.getValue().trim().length() == 0)
			return defValue;
		return Integer.parseInt(p.getValue());
	}
	/**
	 * 获取字符串参数值
	 * @param ssn
	 * @param site
	 * @param param
	 * @param defValue
	 * @return
	 * @throws Exception
	 */
	public static String getStringParam(
		Session ssn,
		SiteForm site,
		String param,
		String defValue)
		throws SQLException, HibernateException  {
		ParamForm p = getParam(ssn, site, param);
		if (p == null || p.getValue() == null)
			return defValue;
		return p.getValue();
	}
	/**
	 * 获取日期型参数值
	 * @param ssn
	 * @param site
	 * @param param
	 * @param defValue
	 * @return
	 * @throws Exception
	 */
	public static Date getDateParam(
		Session ssn,
		SiteForm site,
		String param,
		Date defValue)
		throws SQLException, HibernateException, ParseException  {
		ParamForm p = getParam(ssn, site, param);
		if (p == null || p.getValue() == null)
			return defValue;
		return FMT_DATE.parse(p.getValue());
	}
	/**
	 * 获取时间型参数值
	 * @param ssn
	 * @param site
	 * @param param
	 * @param defValue
	 * @return
	 * @throws Exception
	 */
	public static Date getTimeParam(
		Session ssn,
		SiteForm site,
		String param,
		Date defValue)
		throws SQLException, HibernateException, ParseException  {
		ParamForm p = getParam(ssn, site, param);
		if (p == null || p.getValue() == null)
			return defValue;
		return FMT_TIME.parse(p.getValue());
	}
	/**
	 * 获取日期时间类型参数值
	 * @param ssn
	 * @param site
	 * @param param
	 * @param defValue
	 * @return
	 * @throws Exception
	 */
	public static Date getDateTimeParam(
		Session ssn,
		SiteForm site,
		String param,
		Date defValue)
		throws SQLException, HibernateException, ParseException  {
		ParamForm p = getParam(ssn, site, param);
		if (p == null || p.getValue() == null)
			return defValue;
		return FMT_DATETIME.parse(p.getValue());
	}

	public final static DateFormat FMT_TIME = new SimpleDateFormat("hh:mm:ss");
	public final static DateFormat FMT_DATE =
		new SimpleDateFormat("yyyy-MM-dd");
	public final static DateFormat FMT_DATETIME =
		new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

}
