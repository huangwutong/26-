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
 * @author ZT
 *
 */
public class RepliesTei extends TagExtraInfo {

	public final static String PAGE_COUNT 	= "pageCount";	//符合条件的页数
	public final static String REPLY_COUNT 	= "replyCount";	//符合条件的评论数
	public final static String CUR_PAGE 	= "curPage";	//当前页数
	public final static String PER_PAGE 	= "perPage";	//每页显示评论数
	public final static String SCREEN_COUNT = "scrCount";	//分页显示的屏数
	public final static String TIME_STR 	= "timeString";	//查询评论的显示

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
			   REPLY_COUNT,
			   "java.lang.Integer",
			   true,
			   VariableInfo.AT_BEGIN),
			new VariableInfo(
			   CUR_PAGE,
			   "java.lang.Integer",
			   true,
			   VariableInfo.AT_BEGIN),
			new VariableInfo(
			   PER_PAGE,
			   "java.lang.Integer",
			   true,
			   VariableInfo.AT_BEGIN),
			new VariableInfo(
			   SCREEN_COUNT,
			   "java.lang.Integer",
			   true,
			   VariableInfo.AT_BEGIN),
			new VariableInfo(
			   TIME_STR,
			   "java.lang.String",
			   true,
			   VariableInfo.AT_BEGIN)};
	}
}
