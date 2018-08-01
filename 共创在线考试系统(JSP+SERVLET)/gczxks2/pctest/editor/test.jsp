<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>
<title>
test
</title>
</head>
<body bgcolor="#ffffff">
<h1>
JBuilder Generated JSP


<%
String msg="this is a example";
String strJS="<SCRIPT language=javascript>" +"\n";
strJS=strJS + "alert('" + msg + "');" +"\n";
strJS=strJS + "</script>";
out.print(strJS) ;
%>





</h1>
</body>
</html>
