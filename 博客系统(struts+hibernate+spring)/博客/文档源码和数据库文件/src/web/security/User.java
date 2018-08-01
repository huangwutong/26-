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
 * 用户
 * <p>
 * 在WebSecurity中User表示为事实中的一个操作者
 * 例如系统管理员小刘是一个用户,小李也是一个用户
 * </p>
 * @author liudong
 */
public interface User extends Actor{

	public final static String KEY = User.class.getName();
	/**
	 * 获取该用户的访问密码
	 * @return
	 */
	public String getPassword();
	/**
	 * 返回用户所在的组的集合
	 * @return
	 */
	public Group[] groups();
}
