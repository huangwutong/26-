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

import web.security.Range;

/**
 * 可操作范围的实现类
 * @author liudong
 */
public class RangeImpl implements Range, Serializable {

	protected String name;
	protected String desc;
	
	public RangeImpl(){		
	}

	public RangeImpl(String name){
		this.name = name;
	}
	
	public RangeImpl(String name, String desc){
		this.name = name;
		this.desc = desc;
	}
	/* (non-Javadoc)
	 * @see com.clickcom.web.security.Range#equals(com.clickcom.web.security.Range)
	 */
	public boolean equals(Range range) {
		boolean be = false;
		if(name!=null && range!=null)
			be = name.equals(range.getName());
		return be;
	}
	/* (non-Javadoc)
	 * @see web.security.Range#getName()
	 */
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String toString() {
		return "RANGE["+getClass().getName()+"]:("+name+','+desc+')';
	}
}
