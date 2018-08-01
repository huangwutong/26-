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
package dlog4j.util.tags;

import java.io.IOException;
import java.io.Reader;
import java.util.StringTokenizer;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import dlog4j.util.StringUtils;

/**
 * 用于高亮显示搜索关键字的标签库
 * @author Winter Lau
 */
public class SearchHighlightTag extends BodyTagSupport {

	String color = "red";
	boolean bold = false;
	String query;
	
	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.Tag#doStartTag()
	 */
	public int doStartTag() throws JspException {
		return EVAL_BODY_BUFFERED;
	}

	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.Tag#doStartTag()
	 */
	public int doEndTag() throws JspException {
		Reader reader = getBodyContent().getReader();
		char[] buf = new char[1024];
		try{
			StringBuffer content = new StringBuffer(1024);
			do{
				int  rc = reader.read(buf);
				if(rc>0)
					content.append(buf,0,rc);
				if(rc<1024)
					break;
			}while(true);
			//整理content
			if(query!=null && !StringUtils.isEmpty(query.trim())){
				String startTag = "<font color=" + color + ">";
				String endTag = "";
				if(bold){
					startTag += "<b>";
					endTag = "</b>";
				}			
				endTag += "</font>";
				String replaceContent = content.toString();
				StringTokenizer st = new StringTokenizer(query);
				while(st.hasMoreElements()){
					String key = st.nextToken();
					if(key.length()<key.getBytes().length)
						replaceContent = StringUtils.replace(replaceContent, key, startTag + key + endTag);
					else{
						//使用大小写无关的替换策略
						replaceContent = StringUtils.replaceIgnoreCase(replaceContent, key, startTag + key + endTag);
					}
				}
				pageContext.getOut().write(replaceContent);
			}
			else
				pageContext.getOut().write(content.toString());
		}catch(IOException e0){
		}
		return EVAL_PAGE;
	}
	
	public boolean isBold() {
		return bold;
	}
	public void setBold(boolean bold) {
		this.bold = bold;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getQuery() {
		return query;
	}
	public void setQuery(String query) {
		this.query = query;
	}
}
