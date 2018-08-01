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

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

/**
 * 用于在页面上执行for循环的标签
 * @author Liudong
 */
public class ForLoopTag extends BodyTagSupport {
    
    String id = "idx";
    int from = 0;
    int to = 0;
    int step = 1;
    int curIdx = -1; 	//用于保存当前索引

    public int doEndTag() throws JspException {
        release();
        return EVAL_PAGE;
    }
    public void release() {
        id = "idx";
        from = 0;
        to = 0;
        step = 1;
        curIdx = -1;
    }
    /* (non-Javadoc)
     * @see javax.servlet.jsp.tagext.BodyTag#doInitBody()
     */
    public void doInitBody() throws JspException {
        if(curIdx==-1)
            curIdx = from;
        pageContext.setAttribute(id, new Integer(curIdx));
    }
    public int doStartTag() throws JspException {
        return (curIdx>=to)?SKIP_BODY:EVAL_BODY_AGAIN;
    }
    /* (non-Javadoc)
     * @see javax.servlet.jsp.tagext.IterationTag#doAfterBody()
     */
    public int doAfterBody() throws JspException {
        try {
            getBodyContent().writeOut(getPreviousOut());
            getBodyContent().clear();
        }catch(IOException e) {
            throw new JspException(e);
        }
        curIdx += step;
        pageContext.setAttribute(id, new Integer(curIdx));
        if(curIdx>to)
            return SKIP_BODY;
        return EVAL_BODY_AGAIN;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getFrom() {
        return String.valueOf(from);
    }
    public void setFrom(String from) {
        try {
            this.from = Integer.parseInt(from);
        }catch(NumberFormatException e) {
            Object obj = pageContext.getAttribute(from);
            if(obj!=null&&obj instanceof Integer)
                this.from = ((Integer)obj).intValue();
        }
    }
    public int getStep() {
        return step;
    }
    public void setStep(String step) {
        this.step = Integer.parseInt(step);
    }
    public String getTo() {
        return String.valueOf(to);
    }
    public void setTo(String to) {
        try {
            this.to = Integer.parseInt(to);
        }catch(NumberFormatException e) {
            Object obj = pageContext.getAttribute(to);
            if(obj!=null&&obj instanceof Integer)
                this.to = ((Integer)obj).intValue();
        }
    }
}
