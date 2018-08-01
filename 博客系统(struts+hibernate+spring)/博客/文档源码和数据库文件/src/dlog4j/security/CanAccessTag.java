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
import web.security.Operation;
import web.security.Privilege;
import web.security.Range;
import web.security.Resource;
import web.security.impl.PrivilegeImpl;

/**
 * 用来在页面上进行判断用户时候有访问的权限
 * @author Winter Lau
 */
public class CanAccessTag extends TagSupport {

	protected String resource;
	protected String operation;
	protected String range;
	
	public int doStartTag() throws JspException {
		UserForm user = UserForm.getLoginUser((HttpServletRequest)pageContext.getRequest());
		if(user==null)
			return SKIP_BODY;
		DlogRole role = user.getRole();
		if(role==null)
			return SKIP_BODY;
		return role.canDo(getPrivilege())?EVAL_BODY_INCLUDE:SKIP_BODY;
	}

	protected Privilege getPrivilege() {
		try{
			SecurityConfig sc = SecurityConfig.getConfig();
			Resource res = sc.getResourceByName(resource);
			Operation opt = sc.getOperationByName(operation);
			Range rng = sc.getRangeByName(range);
			return new PrivilegeImpl(res,opt,rng);
		}catch(Exception e){
			pageContext.getServletContext().log("",e);
		}
		return null;
	}
	public String getOperation() {
		return operation;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}
	public String getRange() {
		return range;
	}
	public void setRange(String range) {
		this.range = range;
	}
	public String getResource() {
		return resource;
	}
	public void setResource(String resource) {
		this.resource = resource;
	}
}
