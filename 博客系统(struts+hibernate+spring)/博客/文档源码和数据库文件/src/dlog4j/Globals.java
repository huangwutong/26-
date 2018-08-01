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

import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 * @author Liudong
 * 全局常量
 */
public interface Globals {

	public final static String ACTION_PATH_KEY = "dlog4j_FORWARD_PATH";
	
	public final static String PARAM_MAIN = "main";
	
	public final static String PARAM_SITE = "siteName";

	public final static String HIBERNATE_SESSIONS_KEY = "net.sf.hibernate.SessionFactory";
	
	public final static String PARAM_CATEGORYID = "cat_id";
	public final static String PARAM_LOG		= "log_id";
	
	public final static String PARAM_PAGE = "page";
	
	public final static String PARAM_YEAR = "log_year";
	
	public final static String PARAM_MONTH = "log_month";
	
	public final static String PARAM_DATE = "log_date";
	
	public final static String PARAM_USER = "userid";
	
	public final static DateFormat FORMAT_DT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
}
