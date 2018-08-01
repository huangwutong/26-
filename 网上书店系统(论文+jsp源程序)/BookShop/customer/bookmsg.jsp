<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="../error/error.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>查看图书信息</title>
<jsp:useBean id="books" class="BookShop.MyDb" scope="page"/>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
</head>
<%! String categoryname,idbook,suppliername,price,bookname,outday,author,details,imageurl;
	int hotdeal;
%>
<body > 
<form  method="post" name="form1" action="../shop/trade.jsp">
<p>&nbsp;</p> 
<table width="392"  border="1" align="center" cellpadding="-1" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#0066ff" bordercolordark="#FFFFFF" > 
  <caption> 
  <div class="two">图书信息</div> 
  <p></p> 
  </caption> 
<%
	idbook=(String)request.getParameter("idbook");
	String sqls="SELECT idbook,bookname,author,outday,details,price,imageurl,hotdeal,categoryname,suppliername FROM books as a,category as b,supplier as c  WHERE idbook='"+idbook+"' AND a.idcategory=b.idcategory AND a.idsupplier=c.idsupplier";
	Statement stmt=books.getstmtread();
	ResultSet rs=stmt.executeQuery(sqls);
	while(rs.next()){
		idbook=rs.getString("idbook");
		bookname=rs.getString("bookname");
		author=rs.getString("author");
		outday=rs.getString("outday");
		details=rs.getString("details");
		price=rs.getString("price");
		imageurl=rs.getString("imageurl");
		hotdeal=rs.getInt("hotdeal");
		categoryname=rs.getString("categoryname");
		suppliername=rs.getString("suppliername");
		
		idbook=books.outStr(idbook);
		bookname=books.outStr(bookname);
		author=books.outStr(author);
		outday=books.outStr(outday);
		details=books.outStr(details);
		imageurl=books.outStr(imageurl);
		categoryname=books.outStr(categoryname);
		suppliername=books.outStr(suppliername);

%>
    <tr> 
      <td width="85" height="22" align="center" >图书编号： </td> 
      <td width="198" height="22" ><%=idbook%>&nbsp;</td>
      <td width="101" height="22" align="center" >图书封面</td> 
    </tr> 
    <tr> 
      <td height="22" align="center">图书名称：</td> 
      <td height="22"><%=bookname%>&nbsp;</td>
      <td width="101" rowspan="7" align="center" valign="middle"  ><p>
         <img src="../image/<%=imageurl%>"  width="100" height="132" border="0">
</td> 
    </tr> 
    <tr> 
      <td height="22" align="center">图书类别：</td> 
      <td height="22"><%=categoryname%>&nbsp;</td>
    </tr>
    <tr>
      <td height="22" align="center">供 应 商：</td>
      <td height="22"><%=suppliername%>&nbsp;</td>
    </tr> 
    <tr> 
      <td height="22" align="center">出版日期：</td> 
      <td height="22"><%=outday%>&nbsp;</td>
    <tr> 
      <td height="22" align="center">作&nbsp;&nbsp;&nbsp;&nbsp;者：</td> 
      <td height="22"><%=author%>&nbsp;</td>
    </tr> 
    <tr> 
      <td height="22" align="center">售&nbsp;&nbsp;&nbsp;&nbsp;价：</td> 
      <td height="22"><%=price%></td>
    </tr> 
    <tr> 
      <td align="center">热&nbsp;点&nbsp;书：</td> 
      <td><%
	if(hotdeal==1){
		out.print("是");
	}else{
		out.print("否");
	}
%></td>
    </tr> 
    <tr> 
      <td height="70" align="center" valign="middle">简&nbsp;&nbsp;&nbsp;&nbsp;介：</td> 
      <td colspan="2" valign="top"><%=details%>&nbsp;</td> 
    </tr>
    <tr> 
      <td height="22" colspan="2" align="center" valign="middle">
	  <input type="image" src="../image/add.gif" alt="添加购物车"align="middle">
      <input name="action" value="add" type="hidden">	  
	<input type="hidden" name="id" value="<%=idbook%>">
	  </td> 
      <td height="22" align="center" valign="middle"><a href="javascript:history.back()">返回</a></td>
    </tr>
<%
	}
	books.close();
	pageContext.removeAttribute("books");
%>
</table> 
</form>
</body>
</html>