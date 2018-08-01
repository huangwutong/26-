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

import java.util.Properties;

import javax.servlet.jsp.tagext.TagData;

/**
 * 用于输出id的TEI基类
 * 其他类只需要扩展该类并实现 getExportClass 方法即可
 * @author Winter Lau
 */
public abstract class OutputID_TEI extends BaseTEI {

	protected Properties getExportVars(TagData data) {
		Properties p = new Properties();
		p.setProperty(data.getAttributeString("id"), getObjectClass());
		return p;
	}
	
	/**
	 * 返回输出对象的类名
	 * @return
	 */
	protected abstract String getObjectClass();
}
