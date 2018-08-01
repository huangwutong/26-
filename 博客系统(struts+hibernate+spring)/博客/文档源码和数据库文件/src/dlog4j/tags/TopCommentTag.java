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
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Session;
import dlog4j.ReplyManager;
import dlog4j.SiteManager;
import dlog4j.formbean.SiteForm;
import dlog4j.formbean.UserForm;

/**
 * @author Liudong
 * TOP N Comment
 */
public class TopCommentTag extends DlogBaseTag {

	int count = 10;
	
    public int doEndTag() throws JspException {
        release();
        return EVAL_PAGE;
    }
    public void release() {
        count = 10;
    }
	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.Tag#doStartTag()
	 */
	public int doStartTag() throws JspException {
		if (pageContext.getAttribute(id) == null) {
			Session session = null;
			List replies = null;
			try {
				session = getSession();
				SiteForm site = SiteManager.getCurrentSite(pageContext.getRequest());
				UserForm loginUser = UserForm.getLoginUser((HttpServletRequest)pageContext.getRequest());
				replies = ReplyManager.listReplies(session, site, loginUser, count);
			} catch (SQLException e) {
				throw new JspException(e);
			} catch (HibernateException e) {
				throw new JspException(e);
			} finally {
				try {
					closeSession(session);
				} catch (Exception e) {}
			}
			if (replies == null)
				replies = new ArrayList();
			pageContext.setAttribute(id, replies);
		}
		return SKIP_BODY;
	}

	/**
	 * @return
	 */
	public int getCount() {
		return count;
	}

	/**
	 * @param i
	 */
	public void setCount(int i) {
		count = i;
	}

	/**
	 * @param i
	 */
	public void setCount(Integer i) {
		count = i.intValue();
	}

	/**
	 * @param i
	 */
	public void setCount(String i) {
		count = Integer.parseInt(i);
	}

}
