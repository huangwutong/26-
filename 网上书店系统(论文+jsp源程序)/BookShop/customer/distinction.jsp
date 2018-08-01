<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="../error/error.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>图书分类</title>
<jsp:useBean id="books" class="BookShop.MyDb" scope="page"/><link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<script language="javascript" src="../css/bs.js"></script>
<style type="text/css">
<!--
.style1 {
	color: #8B88CA;
	font-size: 20px;
}
-->
</style>
</head>
<%! String sqls,categoryname;
	int idcategory;
%>
<body > 
<table width="134" border="0" align="center"> 
  <tr> 
    <td width="150" height="60"><img src="../image/mrbiao.gif"></td> 
  </tr>
  <tr>
    <td height="68" align="center"><span class="style1">图书类别列表</span></td>
  </tr> 
  <%	sqls="SELECT * FROM category ORDER BY categoryname";
	Statement stmt=books.getstmtread();
	ResultSet rs=stmt.executeQuery(sqls);
	if(!rs.next()){
%>
  <tr>
    <td height="40" align="center" valign="bottom" class="red12">暂无图书列表</td>
  </tr> 
<%
	}
	rs.previous();
	while(rs.next()){	
		idcategory=rs.getInt(1);
		categoryname=rs.getString(2);
		categoryname=books.outStr(categoryname);
%> 
  <tr> 
    <td height='27' align='left' valign='top'>&nbsp;&nbsp;<a href="look.jsp?idcategory=<%=idcategory%>" target="mainFrame"><%=categoryname%></a></td> 
  </tr> 
<%	
	}
	books.close();
	pageContext.removeAttribute("books");
%> 
</table> 
</body>
</html>
