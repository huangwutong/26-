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

import dlog4j.formbean.CategoryForm;

/**
 * @author Liudong
 * 日志分类标签库的输出变量定义
 */
public class CategoryTei extends TagExtraInfo {

	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.TagExtraInfo#getVariableInfo(javax.servlet.jsp.tagext.TagData)
	 */
	public VariableInfo[] getVariableInfo(TagData data) {
		String cid = data.getAttributeString("catid");
		if(cid!=null)
		return new VariableInfo[] {
			new VariableInfo(
				data.getAttributeString("id"),
				"java.util.List",
				true,
				VariableInfo.AT_BEGIN),
			new VariableInfo(
				cid,
				CategoryForm.class.getName(),
				true,
				VariableInfo.AT_BEGIN)};
		else
		return new VariableInfo[] {
			new VariableInfo(
				data.getAttributeString("id"),
				"java.util.List",
				true,
				VariableInfo.AT_BEGIN)};		
	}

}
