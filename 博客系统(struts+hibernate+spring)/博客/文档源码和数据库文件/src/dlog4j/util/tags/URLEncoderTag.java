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
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.AccessController;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import sun.security.action.GetPropertyAction;

/**
 * ÓÃÓÚ±àÂëURL×Ö´®µÄ±êÇ©¿â
 * @author Liudong
 */
public class URLEncoderTag extends BodyTagSupport {

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
		char[] buf = new char[32];
		try{
			StringBuffer content = new StringBuffer(32);
			do{
				int  rc = reader.read(buf);
				if(rc>0)
					content.append(buf,0,rc);
				if(rc<32)
					break;
			}while(true);			
			pageContext.getOut().write(encodeURL(content.toString()));		
		}catch(IOException e0){
		}
		return EVAL_PAGE;
	}
	/**
	 * URL×Ö·û±àÂë
	 * @param url
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String encodeURL(String url) throws UnsupportedEncodingException {
	    String dfltEncName = (String)AccessController.doPrivileged(new GetPropertyAction("file.encoding"));	    
	    return URLEncoder.encode(url,dfltEncName);
	}
}
