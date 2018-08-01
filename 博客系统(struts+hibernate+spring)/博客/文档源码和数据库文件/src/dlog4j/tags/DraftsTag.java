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
import java.util.List;

import javax.servlet.jsp.JspException;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Session;
import dlog4j.LogManager;
import dlog4j.SiteManager;
import dlog4j.formbean.SiteForm;
import dlog4j.formbean.UserForm;

/**
 * 用于读出所有的草稿信息的标签库
 * @author Liudong
 */
public class DraftsTag extends DlogBaseTag {
    
    public int doStartTag() throws JspException {	
		Session session = null;
		List drafts = null;
		try{
			session = getSession();
			SiteForm site = SiteManager.getCurrentSite(pageContext.getRequest());
			UserForm user = getLoginUser();
			drafts = LogManager.listDrafts(session,site,user);
			pageContext.setAttribute(id,drafts);
		}catch(SQLException e){
			throw new JspException(e);
		}catch(HibernateException e){
			throw new JspException(e);
		}finally{		
			try{
				closeSession(session);
			}catch(Exception e){}
		}
        return SKIP_BODY;
    }
}
