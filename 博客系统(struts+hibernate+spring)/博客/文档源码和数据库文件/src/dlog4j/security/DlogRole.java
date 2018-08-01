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

import java.io.IOException;

import org.xml.sax.SAXException;

import web.security.Operation;
import web.security.Privilege;
import web.security.Range;
import web.security.Resource;
import web.security.impl.PrivilegeImpl;
import web.security.impl.RoleImpl;

/**
 * DLOG平台的角色扩展
 * @author Winter Lau
 */
public class DlogRole extends RoleImpl {
	
	public final static int ROLE_GUEST = 1;
	public final static int ROLE_COMMON = 2;
	public final static int ROLE_FRIEND = 4;
	public final static int ROLE_BUDDY = 8;
	public final static int ROLE_MANAGER = 16;

	protected int id;
	
	/**
	 * 该方法是提供给Digester使用，请不要使用该方法
	 * @param pvg
	 * @throws SAXException
	 * @throws IOException
	 */
	public void addPrivilege(String res, String opt, String rng) throws IOException, SAXException{
		SecurityConfig sc = SecurityConfig.getConfig();
		Resource oRes = sc.getResourceByName(res);
		Operation oOpt = sc.getOperationByName(opt);
		Range oRng = sc.getRangeByName(rng);
		Privilege pvg = new PrivilegeImpl(oRes,oOpt,oRng);
		privileges.add(pvg);
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String toString() {
		return "ROLE:("+id+','+name+','+desc+','+privileges.size()+')';
	}
}
