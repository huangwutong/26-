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
 * 目标资源，例如用户维护，日志维护等
 * @author liudong
 */
public interface Resource {
	
	/**
	 * 返回资源对应唯一的名称
	 * @return
	 */
	public String getName();

	/**
	 * 资源的详细描述信息
	 * @return
	 */
	public String getDesc();
	
	/**
	 * 判断两个资源是否相容纳
	 * @param res
	 * @return
	 */
	public boolean equals(Resource res);

}
