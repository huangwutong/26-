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
 * 操作
 * <p>
 * 操作就是对一项具体的功能的作用，例如添加、修改、删除等操作
 * </p>
 * @author liudong
 */
public interface Operation {
	
	public final static String EDIT 	= "Edit";
	public final static String DELETE 	= "Delete";
	public final static String CREATE 	= "Create";
	public final static String LIST 	= "List";
	public final static String VIEW 	= "View";
	
	/**
	 * 得到操作的名称
	 * @return
	 */
	public String getName();
	
	/**
	 * 操作的详细描述信息
	 * @return
	 */
	public String getDesc();

	/**
	 * 判断两个操作是否想容纳
	 * @param opt
	 * @return
	 */
	public boolean equals(Operation opt);
}
