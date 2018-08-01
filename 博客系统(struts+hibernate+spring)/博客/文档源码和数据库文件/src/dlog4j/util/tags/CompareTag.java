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

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * @author Liudong
 * 比较两个变量大小的标签库
 */
public class CompareTag extends TagSupport {

	public final static int EQUAL = 0;				//等于
	public final static int NOT_EQUAL = 1;			//不等于
	public final static int GREATER_THAN = 2;		//大于
	public final static int NOT_GREATER_THAN = 3;	//不大于
	public final static int LESS_THAN = 4;			//小于
	public final static int NOT_LESS_THAN = 5;		//不小于
	public final static int QUOTIENT = 100;			//求商
	public final static int COMPLIMENT_ZERO = 101;//余数为零
	public final static int COMPLIMENT_NOT_ZERO = 102;//余数不为零

	String num1;
	String num2;
	int method = 0;
	
    public int doEndTag() throws JspException {
        //release();
        return EVAL_PAGE;
    }
    /*
    public void release() {
        method = 0;
        num1 = null;
        num2 = null;
    }*/
	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.Tag#doStartTag()
	 */
	public int doStartTag() throws JspException {
		Object obj1 = pageContext.findAttribute(num1);
		Object obj2 = pageContext.findAttribute(num2);
		String s1 = (obj1!=null)?obj1.toString():num1;
		String s2 = (obj2!=null)?obj2.toString():num2;
		return compare(s1,s2,method)?EVAL_BODY_INCLUDE:SKIP_BODY;
	}
	/**
	 * 两数字比较,通过重载该类来实现更高级的比较操作
	 * @param s1
	 * @param s2
	 * @param extend
	 * @return
	 */
	public boolean compare(String s1, String s2, int extend){
	    if(s1==null||s2==null)
	        return false;
		int i1 = Integer.parseInt(s1);
		int i2 = Integer.parseInt(s2);
		if(extend==EQUAL && i1==i2)
			return true;
		if(extend==NOT_EQUAL && i1!=i2)
			return true;
		if(extend==GREATER_THAN && i1>i2)
			return true;
		if(extend==LESS_THAN && i1<i2)
			return true;
		if(extend==NOT_LESS_THAN && i1>=i2)
			return true;
		if(extend==NOT_GREATER_THAN && i1<=i2)
			return true;
		if(extend==COMPLIMENT_ZERO)
			return (i1 % i2) == 0;
		if(extend==COMPLIMENT_NOT_ZERO)
			return (i1 % i2) > 0;
			
		return false;
	}

	/**
	 * @return
	 */
	public String getNum1() {
		return num1;
	}

	/**
	 * @return
	 */
	public String getNum2() {
		return num2;
	}

	/**
	 * @param string
	 */
	public void setNum1(String string) {
		num1 = string;
	}
	/**
	 * @param string
	 */
	public void setNum2(String string) {
		num2 = string;
	}

	/**
	 * @return
	 */
	public int getMethod() {
		return method;
	}

	/**
	 * @param i
	 */
	public void setMethod(int i) {
		method = i;
	}

}
