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
 * 罗列出指定目录的所有文件标签定义的输出变量
 * 
 * @author liudong
 */
public class ListFilesTEI extends TagExtraInfo {

	/*
	 * (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.TagExtraInfo#getVariableInfo(javax.servlet.jsp.tagext.TagData)
	 */
	public VariableInfo[] getVariableInfo(TagData data) {
		return new VariableInfo[] { 
				new VariableInfo(data.getAttributeString("id"), 
								 "java.util.List", 
								 true,
								 VariableInfo.AT_BEGIN),
				new VariableInfo(data.getAttributeString("pathId"), 
								 "java.lang.String", 
								 true,
								 VariableInfo.AT_BEGIN)};
	}
}