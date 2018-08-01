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

<html>
<head>
<title><bean:message key="USER_SEARCH" bundle="html"/></title>
<style>
  html,body,textarea { font-family: verdana,arial; font-size: 9pt; };
</style>
</head>
<script language="javascript">
	function clickOk(){
		if(searchForm.userid.value==""){
			alert("<bean:message key="USER_SEARCH_NAME" bundle="html"/>");
			searchForm.userid.focus();
			return false;
		}
		var url = "../user_list.jspe?query=" + searchForm.userid.value;
		window.opener.document.location.href = url;
		window.close();
	}
</script>
<body onload="searchForm.userid.focus()" style="background: threedface; color: windowtext; margin: 10px; BORDER-STYLE: none">
<form name="searchForm">
	<bean:message key="USER_SEARCH_TIP" bundle="html"/><input type="text" name="userid" value=""/><input type="button" value="GO" onclick="clickOk()"/>
</form>
</body>
</html>