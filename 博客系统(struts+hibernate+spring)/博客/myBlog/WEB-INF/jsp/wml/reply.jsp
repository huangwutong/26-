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
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-wml.tld" prefix="wml" %>
<%@ taglib uri="/WEB-INF/security.tld" prefix="security" %>
<%@ taglib uri="/WEB-INF/dlog4j.tld" prefix="dlog" %>

<bean:parameter id="log_id" name="log_id" value="-1"/>
<dlog:getlog id="log" withReplies="false"/>

<card newcontext="true" title="<bean:message key="TO_COMMENT" bundle="wml"/>">
<logic:empty name="log">
<p align="left">
	<bean:message key="SHOWLOG_ERROR" bundle="wml"/>
</p>
</logic:empty>
<logic:notEmpty name="log">
<p align="left">
	<logic:messagesPresent>
		<html:errors/><br/>
	</logic:messagesPresent>
	<bean:message key="CONTENT" bundle="wml"/>:    
    <input type="text" name="content" value=""/>
	<br/>
	<anchor>
		<bean:message key="LOG_SUBMIT" bundle="html"/>
		<wml:go page="/wml/reply.do" method="post">
    		<postfield name="logId" value="<%=log_id%>"/>
    		<postfield name="faceUrl" value="faces/face1.gif"/>
    		<postfield name="content" value="$(content)"/>
    		<postfield name="eventSubmit_AddReply" value="1"/>
    	</wml:go>
	</anchor><br/>
	<wml:link page="/index.jspw"><bean:message key="BACK_TO_HOME" bundle="html"/></wml:link>
</p>
</logic:notEmpty>
</card>