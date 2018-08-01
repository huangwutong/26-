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
import javax.servlet.jsp.PageContext;

import net.sf.hibernate.Session;
import dlog4j.formbean.UserForm;

/**
 * 获取用户资料，用于user_list.jsp页面的用户修改
 * @author Liudong
 */
public class GetUserTag extends DlogBaseTag {

    String scope = "session";
    String userId = null;
    
    public int doStartTag() throws JspException {
        int iScope = PageContext.SESSION_SCOPE;
        if("request".equalsIgnoreCase(scope))
            iScope = PageContext.REQUEST_SCOPE;        
        UserForm userForm = (UserForm)pageContext.getAttribute(id,iScope);
		if(userForm==null) {
		    int rid = -1;
		    try {
		        rid = Integer.parseInt(userId);
		    }catch(Exception e) {}
		    if(rid == -1) {
			    try {
			        rid = Integer.parseInt(pageContext.getRequest().getParameter("userid"));
			    }catch(Exception e) {}		       
		    }
		    if(rid!=-1) {
		        Session ssn = null;
		        try {
		            ssn = getSession();
		            userForm = (UserForm)ssn.load(UserForm.class,new Integer(rid));
		            pageContext.setAttribute(id,userForm,iScope);
		        } catch (Exception e) {
		            throw new JspException(e);
                }finally {
		            try {
		                closeSession(ssn);
		            }catch(Exception e) {}
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
        scope = "session";
        userId = null;
    }
    public String getScope() {
        return scope;
    }
    public void setScope(String scope) {
        this.scope = scope;
    }
    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }
    public void setUserId(int userId) {
        this.userId = String.valueOf(userId);
    }
    public void setUserId(Integer userId) {
        this.userId = userId.toString();
    }
}
