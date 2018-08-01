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
package dlog4j.tags;

import java.sql.SQLException;

import javax.servlet.jsp.JspException;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Session;
import dlog4j.ParamManager;
import dlog4j.SiteManager;
import dlog4j.formbean.ParamForm;
import dlog4j.formbean.SiteForm;

/**
 * @author Liudong
 * 系统参数信息标签库
 */
public class ParamTag extends DlogBaseTag {

	String name ;
	String value;

	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.Tag#doStartTag()
	 */
	public int doStartTag() throws JspException{
		Session ssn = null;
		try{
			ssn = getSession();
			SiteForm site = SiteManager.getCurrentSite(pageContext.getRequest());
			ParamForm param = ParamManager.getParam(ssn,site,name);
			if(param==null){
				param = new ParamForm();
				param.setName(name);
				param.setValue(value);
			}
			pageContext.setAttribute(id, param);
		} catch (SQLException e) {
			throw new JspException(e);
		} catch (HibernateException e) {
			throw new JspException(e);
		}finally{
			try{
				closeSession(ssn);
			}catch(Exception e){}
		}
		return SKIP_BODY;
	}

	/**
	 * @return
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param string
	 */
	public void setName(String string) {
		name = string;
	}

	/**
	 * @return
	 */
	public String getValue() {
		return value;
	}

	/**
	 * @param string
	 */
	public void setValue(String string) {
		value = string;
	}

	/**
	 * @param string
	 */
	public void setValue(int string) {
		value = String.valueOf(string);
	}
	/**
	 * @param string
	 */
	public void setValue(Integer string) {
		value = String.valueOf(string.intValue());
	}

}
