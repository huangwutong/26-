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
<bean:parameter id="status" name="status" value="0"/>
<dlog:messages id="messages" read="true" status="<%=status%>"/>
<bean:size id="msgcount" name="messages"/>
<script language="javascript">
	document.title += ' [<bean:message key="USERINFO_MSG" bundle="html"/>]';
</script>
<table>
<tr>
	<td>[<a href="?msg=0&status=0"><logic:equal name="status" value="0"><b></logic:equal><bean:message key="SHOWMSG_UNREAD" bundle="html"/><logic:equal name="status" value="0"></b></logic:equal></a>]</td>
	<td>[<a href="?msg=0&status=1"><logic:equal name="status" value="1"><b></logic:equal><bean:message key="SHOWMSG_READ" bundle="html"/><logic:equal name="status" value="1"></b></logic:equal></a>]</td>
	<td><font color='red'><html:errors/></font></td>
</tr>
</table>
<logic:lessEqual name="msgcount" value="0">
	<table border=0 height=300 align=center><tr><td align=center><bean:message key="SHOWMSG_EMPTY" bundle="html"/></td></tr></table>	
</logic:lessEqual>
<logic:greaterThan name="msgcount" value="0">
<logic:iterate id="msg" name="messages">
<table width='100%' border='0' cellspacing='0' cellpadding='2'>
<tr bgcolor="#eeeeee">
	<td><bean:message key="SHOWMSG_SENDER" bundle="html"/><html:link page="/viewuser.jspe" paramId="userid" paramName="msg" paramProperty="fromUser.id"><bean:write name="msg" property="fromUser.displayName"/></html:link></td>
	<td><bean:message key="SHOWMSG_SENDTIME" bundle="html"/><bean:write name="msg" property="sendTimeOutput"/></td>
	<td width=30 align=right><a href='sendmsg.jspe?msgid=<bean:write name="msg" property="id"/>&id=<bean:write name="msg" property="fromUser.id"/>&name=<bean:write name="msg" property="fromUser.loginName"/>'><bean:message key="SHOWMSG_REPLY" bundle="html"/></a></td>
	<td width=30 align=right><a href='message.do?status=1&eventSubmit_Delete=<bean:write name="msg" property="id"/>' onclick="return confirm('<bean:message key="SHOWMSG_DELETE_TIP" bundle="html"/>');"><bean:message key="SHOWMSG_DELETE" bundle="html"/></a></td>
</tr>
</table>
<table width='100%' border='0' cellspacing='0' cellpadding='2'>
<tr><td height="1" background="images/LINE1.gif"></td></tr>
<tr><td height=40 valign="top"><bean:message key="SHOWMSG_CONTENT" bundle="html"/></td></tr>
<tr>
<td>
<dlog:format html="<%=(((dlog4j.formbean.MessageForm)msg).getIsHtml()!=1)%>">
<bean:write name="msg" property="content" filter="<%=(((dlog4j.formbean.MessageForm)msg).getIsHtml()!=1)%>"/>
</dlog:format>
</td>
</tr>
<tr><td height="1" background="images/LINE1.gif"></td></tr>
</table>
</logic:iterate>
</logic:greaterThan>