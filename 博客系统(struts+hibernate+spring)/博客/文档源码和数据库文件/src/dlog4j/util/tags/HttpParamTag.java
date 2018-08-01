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

import java.lang.reflect.Constructor;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * 用户处于请求参数的标签库(直接生成指定类型的变量)
 * @author Liudong
 */
public class HttpParamTag extends TagSupport {
    
    String id = null;						//变量名称
    String type = String.class.getName();	//参数类型(默认是字符串类型)
    String name = null;						//参数名
    String value = null;					//如果没有指定参数则使用该缺省值,该类型必须具有一个带一个字符串参数的构造子

    public int doStartTag() throws JspException {
        try {
            Class cls = Class.forName(type);
            Constructor con = cls.getConstructor(new Class[] {String.class});
            String paramValue = pageContext.getRequest().getParameter(name);
            if(paramValue==null)
                paramValue = value;
            Object obj = con.newInstance(new Object[] {paramValue});
            pageContext.setAttribute(id, obj);
        }catch(Exception e) {
            throw new JspException(e);
        }
        return SKIP_BODY;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getValue() {
        return value;
    }
    public void setValue(String value) {
        this.value = value;
    }
}
