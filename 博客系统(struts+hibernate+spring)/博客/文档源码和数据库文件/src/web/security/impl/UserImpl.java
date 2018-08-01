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
import java.util.Vector;

import web.security.Group;
import web.security.Privilege;
import web.security.Role;
import web.security.User;


/**
 * 用户的实现类
 * @author liudong
 */
public class UserImpl implements User, Serializable {
	
	String name;
	String password;
	List roles;
	List groups;

	public UserImpl(){
		this(null);
	}
	
	public UserImpl(String name){
		this.name = name;
	}
	
	/* (non-Javadoc)
	 * @see com.clickcom.web.security.User#groups()
	 */
	public Group[] groups() {
		if(groups == null)
			return null;
		return (Group[])groups.toArray(new Group[groups.size()]);
	}

	/* (non-Javadoc)
	 * @see com.clickcom.web.security.Actor#getName()
	 */
	public String getName() {
		return name;
	}

	/* (non-Javadoc)
	 * @see com.clickcom.web.security.Actor#roles()
	 */
	public Role[] roles() {
		if(roles == null)
			return null;
		return (Role[])roles.toArray(new Role[roles.size()]);
	}

	/**
	 * 增加用户角色
	 * @param role
	 */
	public void addRole(Role role) {
		if(roles==null)
			roles = new Vector();
		if(!roles.contains(role))
			roles.add(role);
	}
	/**
	 * 判断用户所属的角色是否允许访问，否则再判断用户所在的组所属的角色可否访问
	 * @see web.security.Actor#canDo(com.clickcom.web.security.Privilege)
	 */
	public boolean canDo(Privilege pvg) {
		for(int i=0;roles!=null&&i<roles.size();i++){
			if(((Role)roles.get(i)).canDo(pvg))
				return true;
		}
		for(int i=0;groups!=null&&i<groups.size();i++){
			Group g = (Group)groups.get(i);
			Role[] rs = g.roles();
			for(int j=0;rs!=null&&j<rs.length;j++){
				if(rs[j].canDo(pvg))
					return true;
			}
		}
		return false;
	}

	public void setGroups(List groups) {
		this.groups = groups;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setRoles(List roles) {
		this.roles = roles;
	}
	public List getGroups() {
		return groups;
	}
	public List getRoles() {
		return roles;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
