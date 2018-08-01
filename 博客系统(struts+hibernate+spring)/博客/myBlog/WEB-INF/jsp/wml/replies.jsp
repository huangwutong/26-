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
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/security.tld" prefix="security" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-wml.tld" prefix="wml" %>
<%@ taglib uri="/WEB-INF/dlog4j.tld" prefix="dlog" %>

<bean:parameter id="pageIndex" name="page" value="1"/>
<dlog:replies id="replies" size="1"/>

<card title="<bean:message key="NEWEST_COMMENT" bundle="wml"/>">
<logic:iterate id="reply" name="replies" indexId="idx">
<p align="left">
<bean:write name="reply" property="authorName"/><bean:message key="COMMENT_SAY" bundle="html"/>:<br/>
<bean:message key="TITLE" bundle="wml"/>:<bean:write name="reply" property="log.title"/><br/>
<bean:message key="CREATETIME" bundle="wml"/>:<bean:write name="reply" property="writeTime" format="yy-M-d H:m:s"/><br/>
<bean:message key="CONTENT" bundle="wml"/>:<bean:write name="reply" property="wmlContent" filter="false"/><br/>
</p>
<p align="left">
	<security:isNotRoleOf role="guest" orNull="true">
		<wml:link page="/reply.jspw" paramId="log_id" paramName="reply" paramProperty="log.id"><bean:message key="TO_COMMENT" bundle="wml"/></wml:link><br/>
	</security:isNotRoleOf>
</p>
</logic:iterate>
<p align="left"><br/>
	<logic:greaterThan name="pageIndex" value="1">
	<a href="replies.jspw?page=<%=String.valueOf((Integer.parseInt(pageIndex)-1))%>"><bean:message key="PREVIOUS_PAGE" bundle="wml"/></a><br/>
	</logic:greaterThan>
	<dlog:compare num1="<%=String.valueOf((Integer.parseInt(pageIndex)+1))%>" num2="pageCount" method="4">	    		
	<a href="replies.jspw?page=<%=String.valueOf((Integer.parseInt(pageIndex)+1))%>"><bean:message key="NEXT_PAGE" bundle="wml"/></a><br/>
	</dlog:compare>
	<wml:link page="/index.jspw"><bean:message key="BACK_TO_HOME" bundle="html"/></wml:link>
</p>
</card>