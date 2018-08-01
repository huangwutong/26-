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

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Session;
import dlog4j.SiteManager;
import dlog4j.UserManager;
import dlog4j.formbean.UserForm;

/**
 * @author Liudong 用于查询用户资料的标签库
 */
public class UserTag extends DlogBaseTag {

	int userid = -1;

	String detail = "false";

	String loginName = null;

	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.servlet.jsp.tagext.Tag#doStartTag()
	 */
	public int doStartTag() throws JspException {
		if (loginName != null) {
			Session ssn = null;
			try {
				ssn = getSession();
				UserForm user = UserManager.getUser(ssn, SiteManager
						.getCurrentSite(pageContext.getRequest()), loginName);

				if (user != null)
					pageContext.setAttribute(id, user);
			} catch (HibernateException e) {
				throw new JspException(e);
			} catch (Exception e) {
				throw new JspException(e);
			} finally {
				try {
					closeSession(ssn);
				} catch (Exception e) {
				}
			}
		} else {
			int uid = userid;
			if (uid == -1)
				try {
					uid = Integer.parseInt(pageContext.getRequest()
							.getParameter("userid"));
				} catch (Exception e) {
				}
			if (uid > -1) {
				Session ssn = null;
				try {
					ssn = getSession();
					boolean bDetail = "true".equalsIgnoreCase(detail);
					UserForm user = UserManager.getUser(ssn, uid, bDetail);
					if (user != null)
						pageContext.setAttribute(id, user);
				} catch (HibernateException e) {
					throw new JspException(e);
				} catch (Exception e) {
					throw new JspException(e);
				} finally {
					try {
						closeSession(ssn);
					} catch (Exception e) {
					}
				}
			}
		}
		return SKIP_BODY;
	}

	public int doEndTag() throws JspException {
		release();
		return EVAL_PAGE;
	}

	public void release() {
		userid = -1;
		detail = "false";
	}

	/**
	 * @return
	 */
	public String getDetail() {
		return detail;
	}

	/**
	 * @param string
	 */
	public void setDetail(String string) {
		detail = string;
	}

	/**
	 * @return
	 */
	public int getUserid() {
		return userid;
	}

	/**
	 * @param i
	 */
	public void setUserid(int i) {
		userid = i;
	}

	/**
	 * @param i
	 */
	public void setUserid(Integer i) {
		userid = i.intValue();
	}

	/**
	 * @param i
	 */
	public void setUserid(String i) {
		userid = Integer.parseInt(i);
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
}