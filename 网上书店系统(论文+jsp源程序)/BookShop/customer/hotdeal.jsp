<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="../error/error.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>主页</title>
<jsp:useBean id="books" class="BookShop.MyDb" scope="page"/><link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<script language="javascript" src="../css/bs.js"></script>
<%! 
	String idbook,bookname;
%>
</head>
<body topmargin="0" > 
<p>&nbsp;</p>
<table width="646"  border="1" align="center" cellpadding="-1" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#0066ff" bordercolordark="#FFFFFF" > 
  <caption> 
  <div class="two">热点图书</div> 
  <p></p> 
  </caption> 
  <tr>
    <td width="149" height="22" align="center">图书编号</td>
    <td width="404" align="center">图书名称</td>
    <td width="85" align="center">购物车</td>
  </tr> 
<%
	String sqls="SELECT idbook,bookname FROM books WHERE hotdeal=1";
	Statement stmt=books.getstmtread();
	ResultSet rs=stmt.executeQuery(sqls);
	if(!rs.next()){
%>
  <tr>
    <td height="40"  colspan="3"  align="center" class="red12">暂无热点图书</td>
  </tr> 
<%
	books.close();
	}else{
		rs.beforeFirst();
		while(rs.next()){
			idbook=rs.getString(1);
			bookname=rs.getString(2);
		
			idbook=books.outStr(idbook);
			bookname=books.outStr(bookname);
%>
<form action="../shop/trade.jsp" method="post">
  <tr>
    <td height="22" align="center"><%=idbook%></td>
    <td align="center"><a href="bookmsg.jsp?idbook=<%=idbook%>"><%=bookname%></a></td>
    <td align="center">
	  <input type="image" src="../image/add.gif" alt="添加购物车" >
	<input type="hidden" name="action" value="add">
	<input type="hidden" name="id" value="<%=idbook%>">	</td>
  </tr> 
</form>
<%
 		}	
		books.close();
	}
%>
</table> 
<table width="472" align="center"  >
  <tr>
    <td height="50" valign="bottom" class="red12"> 
<%
	String ip="";
	try{
		ip=(String)request.getRemoteAddr();
	}catch(Exception e){
		ip="";
	}
	ip=books.inStr(ip);
	int temp=0,count=0,degree=1;
	String sqls1="SELECT visitip,degree FROM visit WHERE visitip='"+ip+"'";
	stmt=books.getstmtread();
	rs=stmt.executeQuery(sqls1);
	if(rs.next()){
		degree=rs.getInt(2);
		degree++;
		books.close();
		String sqlu="UPDATE visit SET degree="+degree+" WHERE visitip='"+ip+"'";
		Statement stmt1=books.getstmt();
		temp=0;
		temp=stmt1.executeUpdate(sqlu);
	}else{
		books.close();
		String sqli="INSERT INTO visit(visitip) VALUES('"+ip+"')";
		Statement stmt2=books.getstmt();
		temp=0;
		temp=stmt2.executeUpdate(sqli);
	}
	books.close();
	String sqls2="SELECT COUNT(*) FROM visit";
	stmt=books.getstmtread();
	rs=stmt.executeQuery(sqls2);
	if(rs.next()){
		count=rs.getInt(1);
	}
	books.close();
	pageContext.removeAttribute("books");
	out.print("欢迎来自["+ip+"]的朋友"+"<br>");
	out.print("这是您第["+degree+"]次来访"+"<br>");
	out.print("曾有"+count+"位朋友来访");
%>
	</td>
  </tr>
</table>
</body>
</html>
