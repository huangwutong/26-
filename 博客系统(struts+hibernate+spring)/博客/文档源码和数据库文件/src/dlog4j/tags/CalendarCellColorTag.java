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

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import dlog4j.util.StringUtils;

/**
 * @author Liudong
 * 日历单元格背景色
 */
public class CalendarCellColorTag extends TagSupport {

	protected String yearId = "year";
	protected String monthId = "month";
	protected String color=null;
	protected int day;
	
	private boolean isToday = false;
	
	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.Tag#doStartTag()
	 */
	public int doStartTag() throws JspException {
		Calendar cal = Calendar.getInstance();
		int year = ((Integer)pageContext.getAttribute(yearId)).intValue();
		int month = ((Integer)pageContext.getAttribute(monthId)).intValue()-1;
		isToday = cal.get(Calendar.YEAR)==year && cal.get(Calendar.MONTH)==month && cal.get(Calendar.DATE)==day;
		try{
			if(isToday){
				if(StringUtils.isNotEmpty(color)){
					pageContext.getOut().print("<font color='");
					pageContext.getOut().print(color);
					pageContext.getOut().print("'>");
				}
				pageContext.getOut().print("<b>");
			}
		}catch(IOException e){}
		return EVAL_BODY_INCLUDE;
	}

    public int doEndTag() throws JspException {
    	try{
    		if(isToday){
    			pageContext.getOut().print("</b>");
    			if(StringUtils.isNotEmpty(color)){
    				pageContext.getOut().print("</font>");
    			}
    		}
    	}catch(Exception e){}
        return EVAL_PAGE;
    }
	/**
	 * @return
	 */
	public String getMonthId() {
		return monthId;
	}

	/**
	 * @return
	 */
	public String getYearId() {
		return yearId;
	}

	/**
	 * @param string
	 */
	public void setMonthId(String string) {
		monthId = string;
	}

	/**
	 * @param string
	 */
	public void setYearId(String string) {
		yearId = string;
	}

	/**
	 * @return
	 */
	public String getColor() {
		return color;
	}

	/**
	 * @param string
	 */
	public void setColor(String string) {
		color = string;
	}

	/**
	 * @return
	 */
	public Object getDay() {
		return new Integer(day);
	}

	/**
	 * @param i
	 */
	public void setDay(Object i) {
		if(i==null)
			return;
		if(i instanceof Integer)
			day = ((Integer)i).intValue();
		else if(i instanceof String)
			day = Integer.parseInt((String)i);
	}

}
