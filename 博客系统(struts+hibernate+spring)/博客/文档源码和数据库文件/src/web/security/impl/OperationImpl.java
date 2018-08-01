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


/**
 * 操作的实现类
 * @author liudong
 */
public class OperationImpl implements Operation, Serializable{

	protected String name;
	protected String desc;
	
	public OperationImpl() {
	}

	public OperationImpl(String name, String desc) {
		this.name = name;
		this.desc = desc;
	}

	public boolean equals(Operation opt) {
		boolean be = false;
		if(name!=null && opt!=null)
			be = name.equals(opt.getName());
		return be;
	}
	/* (non-Javadoc)
	 * @see com.clickcom.web.security.Operation#getName()
	 */
	public String getName() {
		return name;
	}

	/* (non-Javadoc)
	 * @see com.clickcom.web.security.Operation#getDesc()
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
	public String toString() {
		return "OPT["+getClass().getName()+"]:("+name+','+desc+')';
	}
}
