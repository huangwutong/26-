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
 * 动作者,相关子类有Group,User
 * @author liudong
 */
interface Actor {

	/**
	 * 返回该动作者对象独一无二的名称,可理解为用户的帐号
	 * @return 在系统中唯一的字符串
	 */
	public String getName();
	
	
	/**
	 * 每个行动者可以有多个角色，该方法返回行动者所属的所有角色
	 * @return
	 */
	public Role[] roles();
	
	/**
	 * 返回该行动者是否有对某个资源执行某项操作的权限
	 * @param pvg
	 * @return
	 */
	public boolean canDo(Privilege pvg);
	
}
