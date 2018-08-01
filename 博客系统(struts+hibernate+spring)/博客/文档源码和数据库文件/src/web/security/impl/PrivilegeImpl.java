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

import web.security.Operation;
import web.security.Privilege;
import web.security.Range;
import web.security.Resource;


/**
 * 操作权限的实现类
 * @author liudong
 */
public class PrivilegeImpl implements Privilege, Serializable {
	
	Resource resource;
	Operation operation;
	Range range;

	public PrivilegeImpl() {
	}

	public PrivilegeImpl(Resource resource,Operation operation,Range range) {
		this.resource = resource;
		this.operation = operation;
		this.range = range;
	}

	/* (non-Javadoc)
	 * @see com.clickcom.web.security.Privilege#equals(com.clickcom.web.security.Privilege)
	 */
	public boolean equals(Privilege pvg) {
		if(pvg==this)
			return true;
		if(resource==null || operation==null || range==null)
			return false;
		if(pvg==null||pvg.getResource()==null||pvg.getOperation()==null||pvg.getRange()==null)
			return false;
		boolean bResource = resource.equals(pvg.getResource());
		boolean bOperation= operation.equals(pvg.getOperation());
		boolean bRange = range.equals(pvg.getRange());
		return bResource && bOperation && bRange;
	}

	/* (non-Javadoc)
	 * @see com.clickcom.web.security.Privilege#getResource()
	 */
	public Resource getResource() {
		return resource;
	}

	/* (non-Javadoc)
	 * @see com.clickcom.web.security.Privilege#getOperation()
	 */
	public Operation getOperation() {
		return operation;
	}

	/* (non-Javadoc)
	 * @see com.clickcom.web.security.Privilege#getRange()
	 */
	public Range getRange() {
		return range;
	}

	public void setOperation(Operation operation) {
		this.operation = operation;
	}
	public void setRange(Range range) {
		this.range = range;
	}
	public void setResource(Resource resource) {
		this.resource = resource;
	}

}
