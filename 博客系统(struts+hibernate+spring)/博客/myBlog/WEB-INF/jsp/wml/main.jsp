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
<%@ taglib uri="/WEB-INF/struts-wml.tld" prefix="wml" %>
<%@ taglib uri="/WEB-INF/security.tld" prefix="security" %>
<%@ taglib uri="/WEB-INF/dlog4j.tld" prefix="dlog" %>

<bean:parameter id="cat_id" name="cat_id" value="-1"/>
<bean:parameter id="pageIndex" name="page" value="1"/>
<dlog:category id="categories" catid="cur_cat"/>
<dlog:logs id="logs" catid="<%=cat_id%>"/>

<card title="<logic:notEqual name="cat_id" value="-1"><bean:write name="cur_cat" property="name"/></logic:notEqual><logic:equal name="cat_id" value="-1"><bean:message key="ALL" bundle="wml"/></logic:equal>(<bean:write name="logCount"/>)">
<p mode="nowrap">
<% int i=1; %>
<logic:iterate id="log" name="logs" indexId="idx">
<%=(i++)%>.<wml:link page="/showlog.jspw" paramId="log_id" paramName="log" paramProperty="id"><bean:write name="log" property="titleText"/></wml:link>(<bean:write name="log" property="replyCount"/>,<bean:write name="log" property="viewCount"/>)<br/>
</logic:iterate>
</p>
<p align="left"><br/>
<logic:greaterThan name="pageIndex" value="1">
	<a href="main.jspw?page=<%=String.valueOf((Integer.parseInt(pageIndex)-1))%><logic:notEqual name="cat_id" value="-1">&amp;cat_id=<bean:write name="cat_id"/></logic:notEqual>"><bean:message key="PREVIOUS_PAGE" bundle="wml"/></a><br/>
</logic:greaterThan>
<dlog:compare num1="<%=String.valueOf((Integer.parseInt(pageIndex)+1))%>" num2="pageCount" method="4">	    		
	<a href="main.jspw?page=<%=String.valueOf((Integer.parseInt(pageIndex)+1))%><logic:notEqual name="cat_id" value="-1">&amp;cat_id=<bean:write name="cat_id"/></logic:notEqual>"><bean:message key="NEXT_PAGE" bundle="wml"/></a><br/>
</dlog:compare>
<security:canAccess resource="log" operation="maintain" range="self">
	<wml:link page="/addlog.jspw" paramId="cat_id" paramName="cat_id"><bean:message key="USERINFO_WRITE_LOG" bundle="html"/></wml:link><br/>
</security:canAccess>
<wml:link page="/index.jspw"><bean:message key="BACK_TO_HOME" bundle="html"/></wml:link>
</p>
</card>