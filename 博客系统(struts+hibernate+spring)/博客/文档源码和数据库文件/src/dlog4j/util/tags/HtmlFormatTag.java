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

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.commons.lang.StringUtils;
/**
 * @author Liudong
 * 格式化大文本内容以适应在页面上进行显示
 */
public class HtmlFormatTag extends BodyTagSupport {

	boolean ubb = false;
	boolean html= false;
	boolean face= false;

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
			pageContext.getOut().write(format(content.toString(),ubb,html,face));		
		}catch(IOException e0){
		}
		return EVAL_PAGE;
	}
	/**
	 * HTML输出内容格式转换
	 * @param content
	 * @param useUbb
	 * @param transHtml
	 * @param useFace
	 * @return
	 */
	protected String format(String content, boolean useUbb, boolean transHtml, boolean useFace){
		String html = content;
		if(transHtml){
			html = StringUtils.replace(html,"\t","&nbsp;&nbsp;&nbsp;&nbsp;");//替换跳格
			html = StringUtils.replace(html," ","&nbsp;");//替换空格
			html = StringUtils.replace(html,"\n","<br>");//替换换行
		}
		if(useUbb){
			
		}
		return html;
	}
	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.Tag#release()
	 */
	public void release() {
		super.release();
	}

	/**
	 * @return
	 */
	public boolean isFace() {
		return face;
	}

	/**
	 * @return
	 */
	public boolean isHtml() {
		return html;
	}

	/**
	 * @return
	 */
	public boolean isUbb() {
		return ubb;
	}

	/**
	 * @param b
	 */
	public void setFace(boolean b) {
		face = b;
	}

	/**
	 * @param b
	 */
	public void setHtml(boolean b) {
		html = b;
	}

	/**
	 * @param b
	 */
	public void setUbb(boolean b) {
		ubb = b;
	}

}
