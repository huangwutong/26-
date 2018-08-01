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
 * ������ҳ���Ͻ����ж��û�ʱ���з��ʵ�Ȩ��
 * ʹ�ð취��
 * <xxx:cannotAccess resource="user" operation="view" range=""/>
 * ��˼�ǣ��ж��û��Ƿ��в쿴�û���Ȩ��
 * @author Winter Lau
 */
public class CannotAccessTag extends CanAccessTag {

	public int doStartTag() throws JspException {
		int flag = super.doStartTag();
		return (flag==SKIP_BODY)?EVAL_BODY_INCLUDE:SKIP_BODY;
	}
	
}
