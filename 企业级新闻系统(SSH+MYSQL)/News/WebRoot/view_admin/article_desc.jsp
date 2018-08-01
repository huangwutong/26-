<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/view_admin/inc/publictag.jsp" %>
<html>
<head>
<title>article_desc</title>
<link href="/News/css/css.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#ffffff">
<table border=0 cellpadding=5 width='90%' align=center>
  <tr>
    <td align=center><b>${article.title}</b></td>
  </tr>
  <tr>
    <td>${article.content}</td>
  </tr>
</table>
</body>
</html>
