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

import javax.servlet.jsp.JspException;

import net.sf.hibernate.Session;
import dlog4j.ParamManager;
import dlog4j.SiteManager;
import dlog4j.formbean.SiteForm;

/**
 * @author Liudong
 * 列出所有系统参数的标签库
 */
public class ParamsTag extends DlogBaseTag {

	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.Tag#doStartTag()
	 */
	public int doStartTag() throws JspException {
		Session ssn = null;
		try {
			ssn = getSession();
			SiteForm site =
				SiteManager.getCurrentSite(pageContext.getRequest());
			pageContext.setAttribute(id, ParamManager.listParams(ssn, site));
		} catch (Exception e) {
			throw new JspException(e);
		} finally {
			try {
				closeSession(ssn);
			} catch (Exception e) {
			}
		}
		return SKIP_BODY;
	}
}
