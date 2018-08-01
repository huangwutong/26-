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
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dlog4j.tld" prefix="dlog" %>

<bean:parameter id="userid" name="userid" value=""/>
<dlog:getuser id="user" loginName="<%=userid%>"/>

<html:html locale="true">

<head>
	<title><bean:message key="FETCHPWD_HEAD" bundle="html"/></title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel='stylesheet' type='text/css' href='<html:rewrite page="/css/styles.css"/>'>
</head>
<body>
<logic:empty name="user">
<bean:message key="loginName_noexits" arg0="<%=userid%>"/>
</logic:empty>
<logic:notEmpty name="user">
<logic:empty name="user" property="email">
<bean:message key="FETCHPWD_NO_EMAIL_TIP" arg0="<%=application.getInitParameter("mail_addr")%>" bundle="html"/>
</logic:empty>
<logic:notEmpty name="user" property="email">
<dlog:fetchPwd resultId="result" user="user" />
<%if("SENT".equals(result)){%>
<bean:message key="FETCHPWD_PWD_SENT" arg0="<%=user.getDisplayName()%>" arg1="<%=user.getEmail()%>" bundle="html"/>
<%}else{%>
<bean:message key="FETCHPWD_FAIL" bundle="html"/>:<BR>
<%=((Exception)result).getMessage()%><BR>
<bean:message key="FETCHPWD_FEEDBACK" arg0="<%=application.getInitParameter("mail_addr")%>" bundle="html"/>
<%}%>
<br>
<p align="center">
<a href="#" onclick="window.close();return false;"><b><bean:message key="WINDOW_CLOSE" bundle="html"/></b></a>
</p>
</logic:notEmpty>
</logic:notEmpty>

</body>
</html:html>