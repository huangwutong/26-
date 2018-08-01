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
package dlog4j.security;

import javax.servlet.jsp.JspException;

/**
 * 判断用户是否不是某个角色的标签
 * <xxx:isNotRoleOf role="manager"/>
 * @author Winter Lau
 */
public class IsNotRoleOfTag extends IsRoleOfTag {

	public int doStartTag() throws JspException {
		int result = super.doStartTag();
		return (result==SKIP_BODY)?EVAL_BODY_INCLUDE:SKIP_BODY;
	}
}
