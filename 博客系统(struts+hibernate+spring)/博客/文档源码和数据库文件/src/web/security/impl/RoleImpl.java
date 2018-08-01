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

import web.security.Privilege;
import web.security.Role;


/**
 * 角色的实现类
 * @author liudong
 */
public class RoleImpl implements Role, Serializable {

	protected List privileges;
	protected String name;
	protected String desc;
	
	public RoleImpl(){
		this(null,null);
	}
	
	public RoleImpl(String name, String desc){
		this.name = name;
		this.desc = desc;
		this.privileges = new Vector();
	}

	/* (non-Javadoc)
	 * @see com.clickcom.web.security.Role#privileges()
	 */
	public Privilege[] privileges() {
		if(privileges==null)
			return null;
		return (Privilege[])privileges.toArray(new Privilege[privileges.size()]);
	}
	
	/* (non-Javadoc)
	 * @see com.clickcom.web.security.Role#canDo(com.clickcom.web.security.Privilege)
	 */
	public boolean canDo(Privilege pvg) {
		for(int i=0;privileges!=null&&i<privileges.size();i++){
			Privilege p = (Privilege)privileges.get(i);
			boolean bEqual = p.equals(pvg);
			//System.out.println(getClass().getName()+"("+name+"): " + p.getResource()+","+p.getOperation()+","+p.getRange()+","+bEqual);
			if(bEqual)
				return true;
			break;
		}
		return false;
	}

	/* (non-Javadoc)
	 * @see com.clickcom.web.security.Role#getName()
	 */
	public String getName() {
		return name;
	}

	/* (non-Javadoc)
	 * @see com.clickcom.web.security.Role#getDesc()
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

	public List getPrivileges() {
		return privileges;
	}
	public void setPrivileges(List privileges) {
		this.privileges = privileges;
	}
	public String toString() {
		return "ROLE:("+name+','+desc+')';
	}
}
