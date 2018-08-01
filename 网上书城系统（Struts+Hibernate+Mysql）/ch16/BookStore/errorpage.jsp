<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-nested" prefix="nested"%>

<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title><bean:message key="errorpage.title" /></title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@include file="header.jsp"%>
<table width="759" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td align="center">
		<table width="300" height="150" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td class="title"><bean:message key="errorpage.title" /></td>
			</tr>
			<tr>
				<td align="center" class="body"><span class="error"><html:errors /></span></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<%@include file="footer.jsp"%>
</body>
</html:html>

