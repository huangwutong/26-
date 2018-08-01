<%
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
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dlog4j.tld" prefix="dlog" %>

<dlog:calendar titleId="title" datasId="datas" logcId="logcs"/>
<table border='0' width='100%' align='center' cellspacing='1' cellpadding='1' class='calendar_border'>
<tr>
	<td colspan='7' class='calendar_title'>&nbsp;<b><bean:write name="title"/></b></td>
</tr>
<tr>
	<td class='week'>Su</td>
	<td class='week'>M</td>
	<td class='week'>Tu</td>
	<td class='week'>W</td>
	<td class='week'>Th</td>
	<td class='week'>F</td>
	<td class='week'>Sa</td>
</tr>
<logic:iterate id="cols" name="datas" indexId="iRow">
<tr>
	<logic:iterate id="col" name="cols" indexId="iCol">
	<td align='center' class='date'>
	<logic:equal name="col" value="0">&nbsp;</logic:equal>
	<logic:notEqual name="col" value="0">
		<%
		int logc = logcs[((Integer)col).intValue()-1];
		if(logc>0){%>		
		<a title="<bean:message key="CALENDAR_TODAY" bundle="html"/>(<%=logc%>)" href="<html:rewrite page="/main.jspe"/>?log_year=<bean:write name="year"/>&log_month=<bean:write name="month"/>&log_date=<bean:write name="col"/>"><b>
		<%}%>
		<dlog:calendar_highlight_today color="#ff0000" day="<%=col%>"><bean:write name="col"/></dlog:calendar_highlight_today>
		<%if(logc>0){%>		
		</b></a>
		<%}%>		
	</logic:notEqual>
	</td>
	</logic:iterate>
</tr>
</logic:iterate>
<tr>
	<%
		int nextYear = year.intValue();
		int lastYear = year.intValue();
		int next_m = month.intValue()+1;
		if(next_m>12){
			next_m = 1;
			nextYear++;
		}
		int last_m = month.intValue()-1;
		if(last_m<1){
			last_m = 12;
			lastYear--;
		}
	%>
	<td colspan='7' class='datejump'>
		<a title='<bean:message key="CALENDAR_LAST_MONTH" bundle="html"/>' href='<html:rewrite page="/main.jspe"/>?log_year=<%=lastYear%>&log_month=<%=last_m%>'>&laquo;</a>
		<span class="turn">  MONTH   </span>
		<a title='<bean:message key="CALENDAR_NEXT_MONTH" bundle="html"/>' href='<html:rewrite page="/main.jspe"/>?log_year=<%=nextYear%>&log_month=<%=next_m%>'>&raquo;</a>&nbsp;&nbsp;&nbsp;&nbsp;
		
		<a title='<bean:message key="CALENDAR_LAST_YEAR" bundle="html"/>' href='<html:rewrite page="/main.jspe"/>?log_year=<%=(year.intValue()-1)%>&log_month=<bean:write name="month"/>'>&laquo;</a>
		<span class="turn">  YEAR  </span>
		<a title='<bean:message key="CALENDAR_NEXT_YEAR" bundle="html"/>' href='<html:rewrite page="/main.jspe"/>?log_year=<%=(year.intValue()+1)%>&log_month=<bean:write name="month"/>'>&raquo;</a>
	</td>
</tr>
</table>