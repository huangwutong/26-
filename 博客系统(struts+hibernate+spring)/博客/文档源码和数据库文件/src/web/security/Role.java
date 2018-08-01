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
 * 角色
 * <p>
 * 众所皆知，角色就是定义了用于某些操作权限的集合
 * 例如：图书管理员；客服人员等
 * </p>
 * @author liudong
 */
public interface Role {

	/**
	 * 返回该角色可操作的权限
	 * @return
	 */
	public Privilege[] privileges();
	/**
	 * 得到角色的名称
	 * @return
	 */
	public String getName();
	
	/**
	 * 角色的详细描述信息
	 * @return
	 */
	public String getDesc();

	/**
	 * 返回该角色是否有对某个资源执行某项操作的权限
	 * @param pvg
	 * @return
	 */
	public boolean canDo(Privilege pvg);
}
