<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>主页</title>
<jsp:useBean id="books" class="BookShop.MyDb" scope="page"/><link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<script language="javascript" src="../css/bs.js"></script>
<%! 
	String idbook,bookname,idcustomer;
	float disprice;
	int quantity;
	java.util.Date saletime;
%>
</head>
<body topmargin="0" > 
<p>&nbsp;</p>
<table width="790"  border="1" align="center" cellpadding="-1" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#0066ff" bordercolordark="#FFFFFF" > 
  <caption> 
  <div class="two">购书日志</div> 
  <p></p> 
  </caption> 
  <tr>
    <td width="174" height="22" align="center">图书编号</td>
    <td width="245" align="center">图书名称</td>
    <td width="105" align="center">图书数量</td>
    <td width="118" align="center">购书价格</td>
    <td width="136" align="center">购书日期</td>
  </tr> 
<%
	idcustomer=(String)session.getAttribute("id");
	String sqls="SELECT a.idbook,a.bookname,b.quantity,b.disprice,b.saletime FROM books AS a,salebook AS b WHERE b.idcustomer='"+idcustomer+"' AND a.idbook=b.idbook";
	Statement stmt=books.getstmtread();
	ResultSet rs=stmt.executeQuery(sqls);
	if(!rs.next()){
%>
  <tr align="center">
    <td height="40" colspan="5"  class="red12">您还没有购买过图书</td>
  </tr> 
<%
	}
	rs.beforeFirst();
	while(rs.next()){
		idbook=rs.getString(1);
		bookname=rs.getString(2);
		quantity=rs.getInt(3);
		disprice=rs.getFloat(4);
		saletime=rs.getDate(5);
		
		idbook=books.outStr(idbook);
		bookname=books.outStr(bookname);
%>
  <tr>
    <td width="174" height="22" align="center"><%=idbook%></td>
    <td width="245" align="center"><%=bookname%></td>
    <td width="105" align="center"><%=quantity%></td>
    <td width="118" align="center"><%=disprice%>
	</td>
    <td width="136" align="center"><%=saletime%></td>
  </tr> 
<%
 	}
	books.close();
	pageContext.removeAttribute("books");
%>
</table> 
<p>
<table width="790" align="center">
<tr align="right"><td width="850">
<a href="javascript:history.back()">返回</a>
</td>
</tr>
</table>
</body>
</html>
