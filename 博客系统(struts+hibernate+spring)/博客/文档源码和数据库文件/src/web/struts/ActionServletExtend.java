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

import java.io.File;
import java.util.*;
import javax.servlet.*;
import javax.sql.DataSource;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionServlet;
import org.apache.struts.config.DataSourceConfig;
import org.apache.struts.config.ModuleConfig;
import org.apache.struts.util.*;

/**
 * 扩展Struts的数据源部分
 * @author Winter Lau
 */
public class ActionServletExtend extends ActionServlet {

	/**
	 * 重新初始化数据源
	 */
	protected void initModuleDataSources(ModuleConfig config) throws ServletException 
	{
		ServletContextWriter scw = new ServletContextWriter(getServletContext());
		DataSourceConfig dscs[] = config.findDataSourceConfigs();
		if (dscs == null)
			dscs = new DataSourceConfig[0];
		dataSources.setFast(false);
		for (int i = 0; i < dscs.length; i++) {
			DataSource ds = null;
			boolean encoding = isEncodingEnabled(dscs[i].getProperties());
			try {
				ds = (DataSource) RequestUtils.applicationInstance(dscs[i].getType());
				BeanUtils.populate(ds, rebuildProperties(dscs[i].getProperties()));
				ds.setLogWriter(scw);
			} catch (Exception e) {
				ActionServlet.log.error(internal.getMessage("dataSource.init",dscs[i].getKey()),e);
				throw new UnavailableException(internal.getMessage("dataSource.init", dscs[i].getKey()));
			}
			//判断是否需要进行连接池对象的接管
			if (dscs[i].getProperties().get(ENCODING_KEY) != null) {
				DataSource ds_proxy = (new _DataSource(ds, encoding)).getDataSource();
				getServletContext().setAttribute(dscs[i].getKey()+config.getPrefix(),ds_proxy);
				dataSources.put(dscs[i].getKey(), ds_proxy);
			} else {
				getServletContext().setAttribute(dscs[i].getKey()+config.getPrefix(),ds);
				dataSources.put(dscs[i].getKey(), ds);
			}
		}

		dataSources.setFast(true);
	}

	/**
	 * 返回启用自动编码处理功能
	 * @param props
	 * @return
	 */
	private boolean isEncodingEnabled(Map props) {
		String value = (String) props.get(ENCODING_KEY);
		return TRUE.equalsIgnoreCase(value);
	}

	private Map rebuildProperties(Map props) {
		String webapp_path = getServletContext().getRealPath(ROOT_PATH);
		if (webapp_path.endsWith(File.separator))
			webapp_path = webapp_path.substring(0, webapp_path.length() - 1);
		Properties p = new Properties();
		String key;
		String value;
		for (Iterator keys = props.keySet().iterator(); 
			 keys.hasNext(); 
			 p.setProperty(key, StringUtils.replace(value, WEBAPP_PATH_KEY,webapp_path))) 
		{
			key = (String) keys.next();
			value = (String) props.get(key);
		}

		return p;
	}

	public static final String WEBAPP_PATH_KEY = "${webapp}";
	public static final String ROOT_PATH = "/";
	public static final String ENCODING_KEY = "encoding";
	public static final String TRUE = "true";
}