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
package web.layout;

import dlog4j.util.StringUtils;

/**
 * 对应layout.xml中的一个page
 * @author Winter Lau
 */
public class Page {
	String name;
	String uri;
	String param;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getParam() {
		return param;
	}
	public void setParam(String param) {
		this.param = param;
	}
	public String getUri() {
		return uri;
	}
	public void setUri(String uri) {
		this.uri = uri;
	}
	public boolean equals(Object obj) {
		if(this==obj)
			return true;
		if(obj instanceof Page){
			Page p = (Page)obj;
			return StringUtils.equals(name, p.getName()) &&
				   StringUtils.equals(uri, p.getUri()) &&
				   StringUtils.equals(param, p.getParam());
		}
		return false;
	}
	public String toString() {
		StringBuffer sb = new StringBuffer();
		sb.append("NAME:");
		sb.append(name);
		sb.append(",URI:");
		sb.append(uri);
		sb.append(",PARAM:");
		sb.append(param);
		return sb.toString();
	}
	
	public Object clone(){
		Page p = new Page();
		p.setName(name);
		p.setParam(param);
		p.setUri(uri);
		return p;
	}
}
