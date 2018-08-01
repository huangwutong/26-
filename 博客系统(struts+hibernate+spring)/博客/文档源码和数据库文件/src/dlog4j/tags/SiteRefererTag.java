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

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;

import net.sf.hibernate.Session;

import dlog4j.beans.RefererBean;

/**
 * 用于记录外部网站引用本站页面的标签
 * 使用方法 <xxx:referer logAll="false"/>
 * @author Winter Lau
 */
public class SiteRefererTag extends DlogBaseTag {
	
	public final static String SESSION_KEY = "#SiteRefererTag#";
	boolean logAll = false;

	public int doStartTag() throws JspException {
		HttpServletRequest req = (HttpServletRequest)pageContext.getRequest();
		HttpSession session = req.getSession(true);
		if(logAll || session.getAttribute(SESSION_KEY)==null){
			session.setAttribute(SESSION_KEY,new Date());
			RefererBean rb = new RefererBean(req);
			Session ssn = null;
			try{
				ssn = getSession();
				ssn.save(rb);
			}catch(Exception e){
				pageContext.getServletContext().log("写入访问记录失败",e);
			}finally{
				try{
					commitSession(ssn,true);
				}catch(Exception e){}
			}			
		}
		return SKIP_BODY;
	}
	public boolean isLogAll() {
		return logAll;
	}
	public void setLogAll(boolean logAll) {
		this.logAll = logAll;
	}
}
