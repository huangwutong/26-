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
package dlog4j.tags;

import javax.servlet.jsp.tagext.TagData;
import javax.servlet.jsp.tagext.TagExtraInfo;
import javax.servlet.jsp.tagext.VariableInfo;

/**
 * 成员浏览输出参数定义
 * @author Liudong
 */
public class MemberTei extends TagExtraInfo {

	public final static String PAGE_COUNT 	= "pageCountId";	//符合条件的页数
	public final static String PER_COUNT 	= "usersPageId";	//每页显示用户数
	public final static String USER_COUNT 	= "userCountId";	//符合条件的用户数
	public final static String CUR_PAGE_COUNT 	= "curPageId";	//当前页数

	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.TagExtraInfo#getVariableInfo(javax.servlet.jsp.tagext.TagData)
	 */
	public VariableInfo[] getVariableInfo(TagData data) {
		return new VariableInfo[] {
			 new VariableInfo(
				data.getAttributeString("id"),
				"java.util.List",
				true,
				VariableInfo.AT_BEGIN),
			new VariableInfo(
			   PAGE_COUNT,
			   "java.lang.Integer",
			   true,
			   VariableInfo.AT_BEGIN),
			new VariableInfo(
			   PAGE_COUNT,
			   "java.lang.Integer",
			   true,
			   VariableInfo.AT_BEGIN),
			new VariableInfo(
			   PER_COUNT,
			   "java.lang.Integer",
			   true,
			   VariableInfo.AT_BEGIN),
			new VariableInfo(
			   USER_COUNT,
			   "java.lang.Integer",
			   true,
			   VariableInfo.AT_BEGIN),
			new VariableInfo(
			   CUR_PAGE_COUNT,
			   "java.lang.Integer",
			   true,
			   VariableInfo.AT_BEGIN)};
	}
}
