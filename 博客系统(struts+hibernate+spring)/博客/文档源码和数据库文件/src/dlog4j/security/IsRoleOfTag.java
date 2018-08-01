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
package dlog4j.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import dlog4j.formbean.UserForm;

/**
 * �ж��û��Ƿ�Ϊĳ����ɫ�ı�ǩ
 * <xxx:isRoleOf role="manager"/>
 * @author liudong
 */
public class IsRoleOfTag extends TagSupport {
	
	protected String role;
	protected String user;
	protected boolean orNull = false;
	
	public int doStartTag() throws JspException {	
		UserForm tUser = null;
		if(user==null)
			tUser = UserForm.getLoginUser((HttpServletRequest)pageContext.getRequest());
		else
			tUser = (UserForm)pageContext.findAttribute(user);
		if(tUser==null)
			return orNull?EVAL_BODY_INCLUDE:SKIP_BODY;
		DlogRole uRole = tUser.getRole();
		if(uRole!=null && uRole.getName().equalsIgnoreCase(role)){
			return EVAL_BODY_INCLUDE;
		}
		return SKIP_BODY;
	}
			
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public boolean isOrNull() {
		return orNull;
	}
	public void setOrNull(boolean orNull) {
		this.orNull = orNull;
	}
}
