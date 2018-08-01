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
package web.security;

/**
 * 操作的权限，是Resource和Operation以及可操作范围Range的组合
 * @author liudong
 */
public interface Privilege {
	
	/**
	 * 返回权限对应允许访问的资源
	 * @return
	 */
	public Resource getResource();
	
	/**
	 * 返回权限对应允许的操作
	 * @return
	 */
	public Operation getOperation();
	
	/**
	 * 返回该权限的可操作范围
	 * @return
	 */
	public Range getRange();
	
	/**
	 * 判断两个权限是否相同
	 * @param pvg
	 * @return
	 */
	public boolean equals(Privilege pvg);

}
