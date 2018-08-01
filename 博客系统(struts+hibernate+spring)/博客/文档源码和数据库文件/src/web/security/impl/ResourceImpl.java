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

import web.security.Resource;


/**
 * 受控资源的实现类
 * @author liudong
 */
public class ResourceImpl implements Resource, Serializable {
	
	protected String name;
	protected String desc;
	
	public ResourceImpl(){
		this(null,null);
	}
	
	public ResourceImpl(String name,String desc){
		this.name = name;
		this.desc = desc;
	}

	public boolean equals(Resource res) {
		boolean be = false;
		if(name!=null && res!=null)
			be = name.equals(res.getName());
		return be;
	}
	/* (non-Javadoc)
	 * @see com.clickcom.web.security.Resource#getName()
	 */
	public String getName() {
		return name;
	}

	/* (non-Javadoc)
	 * @see com.clickcom.web.security.Resource#getDesc()
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
		return "RES["+getClass().getName()+"]:("+name+','+desc+')';
	}
	
	public static void main(String[] args){
		ResourceImpl r1 = new ResourceImpl("log",null);
		ResourceImpl r2 = new ResourceImpl("log",null);
		System.out.println(r1.equals(r2));
	}
}
