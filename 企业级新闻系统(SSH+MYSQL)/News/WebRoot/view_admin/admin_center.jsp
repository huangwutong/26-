<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/view_admin/inc/publictag.jsp" %>
<html>
<head>
<title>admin_center</title>
<LINK href="/News/css/css.css" type=text/css rel=stylesheet>
</head>
<body bgcolor="#ffffff">
<table class="tableBorder" width="90%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
<tr>
<td colspan="2" align="center"  background="images/admin_bg_1.gif"><b><font color="#ffffff"><bean:message key="Article.server.count"/></font></b></td>
</tr>
<tr bgcolor="#E8F1FF">
<td width="50%">&nbsp;<bean:message key="Article.server.type"/><font face="Verdana">Windows_NT
（IP：</font>127.0.0.1）</td>
<td width="50%">
&nbsp;Scripting.FileSystemObject<font color=#888888><b>(FSO <bean:message key="Article.notepad.oper"/>)</b></font><font color=green><b> √</b></font>
</td>
</tr>
<tr bgcolor="#E8F1FF">
<td width="50%">&nbsp;<bean:message key="Article.server.allmessage"/>localhost</td>
<td width="50%">
&nbsp;adodb.connection<font color=#888888>(ACCESS <bean:message key="Article.database"/>)</font>&nbsp;<font color=green><b>√</b></font> 2.7
</td>
</tr>
<tr bgcolor="#E8F1FF">
<td width="50%">&nbsp;<bean:message key="Article.script"/>VBScript/5.6.7426</td>
<td width="50%">
&nbsp;JMail.SmtpMail<font color=#888888>(w3 Jmail <bean:message key="Article.oper.message"/>)</font>&nbsp;<font color=red><b>×</b></font>
</td>
</tr>
<tr bgcolor="#E8F1FF">
<td width="50%">&nbsp;<bean:message key="Article.script.message"/></td>
<td width="50%">&nbsp;CDONTS.NewMail<font color=#888888>(<bean:message key="Article.virtual.snedmessage"/>)</font>&nbsp;<font color=green><b>√</b></font> 1.2
</td>
</tr>
<tr bgcolor="#E8F1FF">
<td width="50%">&nbsp;<bean:message key="Article.server.port"/>80</td>
<td width="50%">&nbsp;Persits.MailSender<font color=#888888>(ASPemail <bean:message key="Article.sendmessage"/>)</font>&nbsp;<font color=red><b>×</b></font>
</td>
</tr>
<tr bgcolor="#E8F1FF">
<td width="50%">&nbsp;<bean:message key="Article.web.path"/>E:\shop\admin\admin_center.asp</td>
<td width="50%">&nbsp;SMTPsvg.Mailer<font color=#888888>(ASPemail <bean:message key="Article.sendmessage"/>)</font>&nbsp;<font color=red><b>×</b></font>
</td>
</tr>
<tr bgcolor="#E8F1FF">
<td width="50%">&nbsp;<bean:message key="Article.server.IIS"/>Microsoft-IIS/5.0</td>
<td width="50%">&nbsp;DkQmail.Qmail<font color=#888888>(dkQmail <bean:message key="Article.sendmessage"/>)</font>&nbsp;<font color=red><b>×</b></font>
</td>
</tr>
<tr bgcolor="#E8F1FF">
<td width="50%">&nbsp;<bean:message key="Article.server.CPU"/></td>
<td width="50%">&nbsp;Geocel.Mailer<font color=#888888>(Geocel <bean:message key="Article.sendmessage"/>)</font>&nbsp;<font color=red><b>×</b></font>
</td>
</tr>
<tr bgcolor="#E8F1FF">
<td width="50%">&nbsp;<bean:message key="Article.server.time"/>2007-3-4 16:11:46</td>
<td width="50%">&nbsp;IISmail.Iismail.1<font color=#888888>(IISemail <bean:message key="Article.sendmessage"/>)</font>&nbsp;<font color=red><b>×</b></font>

</td>
</tr>
</table><br>


<table class="tableBorder" width="90%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
<tr>
<td colspan="2" align="center" background="./images/admin_bg_1.gif" height="25"><b><font color="#ffffff">&nbsp;&nbsp;</font></b></td>
</tr>
<tr>
<td width="20%" bgcolor="#E8F1FF">&nbsp;<bean:message key="Article.pogram.deploy"/></td>
<td width="80%" bgcolor="#E8F1FF">ACCP <bean:message key="Article.cause"/></td>
</tr>
<tr>
<td bgcolor="#E8F1FF">&nbsp;<bean:message key="Article.tel"/></td>
<td bgcolor="#E8F1FF">TEL:13997709399    e-mail:369730@qq.com </td>
</tr>
<tr>
<td bgcolor="#E8F1FF">&nbsp;<bean:message key="Article.pogram.reason"/></td>
<td bgcolor="#E8F1FF">
<bean:message key="Article.current.version"/> Version 1.0<br>
<bean:message key="Article.look"/><br>
<bean:message key="Article.success"/></td>
</tr>
</table>
</body>
</html>
