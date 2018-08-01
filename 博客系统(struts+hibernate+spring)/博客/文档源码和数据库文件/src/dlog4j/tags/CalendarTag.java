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

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;

import net.sf.hibernate.Session;

import dlog4j.LogManager;
import dlog4j.SiteManager;
import dlog4j.formbean.UserForm;

/**
 * @author Liudong
 * 日历标签库
 */
public class CalendarTag extends DlogBaseTag {

	protected String paramYear = "log_year";
	protected String paramMonth = "log_month";
	
	protected String yearId = "year";
	protected String monthId = "month";
	protected String titleId = "title";
	protected String datasId = "datas";
	protected String logcId = "logcs";
	
	private final static SimpleDateFormat sdf = new SimpleDateFormat("MMMMM yyyy",Locale.ENGLISH);
	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.Tag#doStartTag()
	 */
	public int doStartTag() throws JspException {
		Calendar cal = Calendar.getInstance();
		try{
			int year = Integer.parseInt(pageContext.getRequest().getParameter(paramYear));	
			if(year>0)
				cal.set(Calendar.YEAR,year);	
		}catch(Exception e){}
		try{
			int month = Integer.parseInt(pageContext.getRequest().getParameter(paramMonth));
			if(month>0&&month<13)
				cal.set(Calendar.MONTH,month-1);	
			else if(month==0){
				cal.set(Calendar.MONTH,11);
				cal.add(Calendar.YEAR,-1);
			}				
			else if(month==13){
				cal.set(Calendar.MONTH,0);
				cal.add(Calendar.YEAR,1);
			}
		}catch(Exception e){}
		
		int[][] datas = buildCalendar(cal);
		pageContext.setAttribute(datasId,datas);
		
		pageContext.setAttribute(yearId,new Integer(cal.get(Calendar.YEAR)));
		pageContext.setAttribute(monthId,new Integer(cal.get(Calendar.MONTH)+1));
		
		pageContext.setAttribute(titleId,sdf.format(cal.getTime()));
		
		//统计每天的日记数
		Session ssn = null;
		try{
			ssn = getSession();
			UserForm u = UserForm.getLoginUser((HttpServletRequest)pageContext.getRequest());
			int[] lcs = LogManager.statLogs(ssn,SiteManager.getCurrentSite(pageContext.getRequest()),u,cal);
			pageContext.setAttribute(logcId, lcs);
		}catch(Exception e){
			throw new JspException(e);
		}finally{
			if(ssn!=null)
				try{
					closeSession(ssn);
				}catch(Exception e){}
		}
		
		return SKIP_BODY;
	}
	/**
	 * 构造日历
	 * @param year
	 * @param month
	 * @return
	 */
	protected static int[][] buildCalendar(Calendar cal){
		cal.set(Calendar.DAY_OF_MONTH,1);
		int firstDateInWeek = cal.get(Calendar.DAY_OF_WEEK)-1;
		int dateOfMonth = getMonthDateCount(cal);
		int base = dateOfMonth + firstDateInWeek;
		int row = base / 7;
		row += ((base%7)>0)?1:0;
		int[][] cals = new int[row][7];
		int iCol=firstDateInWeek,iRow=0;
		for(int i=1;i<=dateOfMonth;i++){ 
			cals[iRow][iCol] = i;			
			if(iCol==6){
				iCol = 0;
				iRow++;
			}
			else
				iCol++;
		}
		return cals;
	}
	/**
	 * 得到指定月份的天数
	 * @param cal
	 * @return
	 */
	protected static int getMonthDateCount(Calendar cal){
		Calendar cal2 = (Calendar)cal.clone();
		cal2.add(Calendar.MONTH,1);
		cal2.set(Calendar.DAY_OF_MONTH,1);
		cal2.add(Calendar.DAY_OF_MONTH,-1);
		return cal2.get(Calendar.DAY_OF_MONTH);
	}
	
	public static void main(String[] args) throws Exception{
		int[][] days = buildCalendar(Calendar.getInstance());
		for(int i=0;i<days.length;i++){
			for(int j=0;j<days[i].length;j++)
				System.out.print(days[i][j]+" ");
			System.out.println();
		}
	}

	/**
	 * @return
	 */
	public String getDatasId() {
		return datasId;
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
	public String getTitleId() {
		return titleId;
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
	public void setDatasId(String string) {
		datasId = string;
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
	public void setTitleId(String string) {
		titleId = string;
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
	public String getParamMonth() {
		return paramMonth;
	}

	/**
	 * @return
	 */
	public String getParamYear() {
		return paramYear;
	}

	/**
	 * @param string
	 */
	public void setParamMonth(String string) {
		paramMonth = string;
	}

	/**
	 * @param string
	 */
	public void setParamYear(String string) {
		paramYear = string;
	}

	/**
	 * @return
	 */
	public String getLogcId() {
		return logcId;
	}

	/**
	 * @param string
	 */
	public void setLogcId(String string) {
		logcId = string;
	}

}
