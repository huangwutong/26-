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
package web.security.impl;

import java.io.Serializable;
import java.util.List;

import web.security.Group;
import web.security.Privilege;
import web.security.Role;


/**
 * 用户组的实现类
 * @author liudong
 */
public class GroupImpl implements Group, Serializable {

	String name;
	String desc;
	List roles;
	
	/* (non-Javadoc)
	 * @see com.clickcom.web.security.Actor#roles()
	 */
	public Role[] roles() {
		if(roles == null)
			return null;
		return (Role[])roles.toArray(new Role[roles.size()]);
	}

	/* (non-Javadoc)
	 * @see com.clickcom.web.security.Actor#canDo(com.clickcom.web.security.Privilege)
	 */
	public boolean canDo(Privilege pvg) {
		for(int i=0;roles!=null&&i<roles.size();i++){
			if(((Role)roles.get(i)).canDo(pvg))
				return true;
		}
		return false;
	}

	/* (non-Javadoc)
	 * @see com.clickcom.web.security.Actor#getName()
	 */
	public String getName() {
		return name;
	}

	/* (non-Javadoc)
	 * @see com.clickcom.web.security.Group#getDesc()
	 */
	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List getRoles() {
		return roles;
	}
	public void setRoles(List roles) {
		this.roles = roles;
	}
}
