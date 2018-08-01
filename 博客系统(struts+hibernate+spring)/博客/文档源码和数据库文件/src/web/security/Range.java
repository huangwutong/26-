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
 * 可操作数据的范围
 * This is for future use.
 * @author liudong
 */
public interface Range {

	/**
	 * 返回范围的标识
	 * @return
	 */
	public String getName();
	
	/**
	 * 判断两个可操作范围是否相等
	 * @param range
	 * @return
	 */
	public boolean equals(Range range);
}
