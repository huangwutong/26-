<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="../error/error.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�Ƽ�ͼ��</title>
<jsp:useBean id="books" class="BookShop.MyDb" scope="page"/><link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<script language="javascript" src="../css/bs.js"></script>
<%! 
	String idbook,bookname;
	int	count;
%>
</head>
<body topmargin="0" > 
<p>&nbsp;</p>
<table width="646"  border="1" align="center" cellpadding="-1" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#0066ff" bordercolordark="#FFFFFF" > 
  <caption> 
  <div class="two">�Ƽ�ͼ��</div> 
  <p></p> 
  </caption> 
  <tr>
    <td width="149" height="22" align="center">ͼ����</td>
    <td width="404" align="center">ͼ������</td>
    <td width="85" align="center">���ﳵ</td>
  </tr> 
<%
	String sqls="SELECT idbook,bookname FROM books WHERE active=1";
	Statement stmt=books.getstmtread();
	ResultSet rs=stmt.executeQuery(sqls);
	if(!rs.next()){
%>
  <tr>
    <td height="40"  colspan="3"  align="center" class="red12">�����Ƽ�ͼ��</td>
  </tr> 
<%
	}
	rs.previous();
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
	  <input type="image" src="../image/add.gif" alt="��ӹ��ﳵ" >
	<input type="hidden" name="action" value="add">
	<input type="hidden" name="id" value="<%=idbook%>">	</td>
  </tr> 
</form>
<%
 	}
	books.close();
	pageContext.removeAttribute("books");
%>
</table> 
<table width="472" align="center"  >
<tr>
  <td height="50" valign="bottom" class="red12">
���Ƽ�ͼ�顷��Ŀ���鿴��
    <%
	try{
	count=Integer.parseInt((String)application.getAttribute("count"));
	}catch(Exception e){
	count++;
	}
	application.setAttribute("count",new Integer(count));
	out.print(count);
%>��</td>
</tr></table>
</body>
</html>
