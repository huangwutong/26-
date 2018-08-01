<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="../error/error.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="books" class="BookShop.MyDb" scope="page"/><link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<script language="javascript" src="../css/bs.js"></script>
</head>
<%! String sqls,idbook,bookname,author,price;
%>
<body> 
<table width="656"  border="1" align="center" cellpadding="-1" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#0066ff" bordercolordark="#FFFFFF" > 
  <tr align="center"> 
    <td width="126" height="22" ><strong>书号</strong></td> 
    <td width="212" height="22" ><strong>书名</strong></td>
    <td width="137" height="22" ><strong>作者</strong></td>
    <td width="81" height="22" ><strong>单价</strong></td>
    <td width="89" height="22" ><strong>购物车</strong></td>
  </tr>
<%	
 	int idcategory=Integer.parseInt((String)request.getParameter("idcategory"));
	sqls="SELECT idbook,bookname,author,price FROM books WHERE idcategory="+idcategory;
	Statement stmt=books.getstmtread();
	ResultSet rs=stmt.executeQuery(sqls);
	if(!rs.next()){
%>
  <tr>
    <td height="40"  colspan="5"  align="center" class="red12">该类别暂无图书</td>
  </tr> 
<%
	}
	rs.previous();
	while(rs.next()){
		idbook=rs.getString(1);
		bookname=rs.getString(2);
		author=rs.getString(3);
		price=rs.getString(4);
%> 
<form action="../shop/trade.jsp" method="post" >
  <tr align="center">
    <td height="22" ><%=idbook%></td>
    <td height="22" ><a href="bookmsg.jsp?idbook=<%=idbook%>"><%=bookname%></a></td>
    <td height="22" ><%=author%></td>
    <td height="22" ><%=price%></td>
    <td height="22" valign="middle" >
	<input type="image" src="../image/add.gif" alt="加入购物车" width="18" height="18"  >
	<input type="hidden" name="action" value="add">
	<input type="hidden" name="id" value="<%=idbook%>">
</td>
  </tr>
</form>	
<%	
	}
	books.close();
	pageContext.removeAttribute("books");
%> 
</table> 
</body>
</html>