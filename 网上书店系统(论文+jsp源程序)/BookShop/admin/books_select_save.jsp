<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>ͼ���ѯ</title>
<jsp:useBean id="books" class="BookShop.MyDb" scope="page"/><link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<script language="javascript" src="../css/bs.js"></script>
</head>
<body> 
<%!
	String idbook,bookname,category,supplier,author,active,hotdeal,details,cost,price,imageurl,stock,sale,categoryname,suppliername;
	java.util.Date outday;
%> 
<table width="825" border="1" align="center" cellpadding="-1" cellspacing="0" bordercolor="#ffffff" bordercolorlight="#0066ff" bordercolordark="#ffffff"> 
  <tr> 
    <th width="71" height="22" >ͼ����</th> 
    <th width="175" >ͼ������</th> 
    <th width="60" >����</th> 
    <th width="88" >����ʱ��</th> 
    <th width="39" >����</th> 
    <th width="40" >�ۼ�</th> 
    <th width="66" >ͼ�����</th> 
    <th width="34" >����</th> 
    <th width="33" >�۳�</th> 
    <th width="37" >����</th> 
    <th width="51" >�ȵ���</th> 
    <th width="66" >���</th> 
    <th width="116" >��Ӧ��</th> 
  </tr> 
  <%
	idbook=(String)request.getParameter("idbook");
	bookname=(String)request.getParameter("bookname");
	category=(String)request.getParameter("category");
	supplier=(String)request.getParameter("supplier");
	author=(String)request.getParameter("author");
	active=(String)request.getParameter("active");
	hotdeal=(String)request.getParameter("hotdeal");
	
	idbook=books.inStr(idbook);
	bookname=books.inStr(bookname);
	category=books.inStr(category);
	author=books.inStr(author);
	supplier=books.inStr(supplier);
	active=books.inStr(active);
	hotdeal=books.inStr(hotdeal);
	
	idbook=books.selectStr(idbook);
	bookname=books.selectStr(bookname);
	category=books.selectStr(category);
	author=books.selectStr(author);
	supplier=books.selectStr(supplier);
	active=books.selectStr(active);
	hotdeal=books.selectStr(hotdeal);
	
	String sqls="SELECT idbook,bookname,author,outday,details,cost,price,imageurl,stock,active,hotdeal,sale,categoryname,suppliername FROM books as a,category as b,supplier as c  WHERE idbook "+idbook+" AND bookname "+bookname+" AND categoryname "+category+" AND author "+author+" AND suppliername "+supplier+" AND active "+active+" AND hotdeal "+hotdeal+" AND a.idcategory=b.idcategory AND a.idsupplier=c.idsupplier";
	Statement stmt=books.getstmtread();
	ResultSet rs=stmt.executeQuery(sqls);
	if(!rs.next()){
  		out.print("<tr>");
    	out.print("<td height='40'  colspan='13'  align='center' class='red12'>û����Ҫ��ѯ�Ľ��</td>"); 
 	 	out.print("</tr>");
		books.close();
		return;
	}
	String color="";
	//countpage��ҳ����sqan��ȣ�count�ܼ�¼��,fpage����ҳ,fcount�ּ�¼��
	String strpages=(String)request.getParameter("pages");
	int pages=0;
	if(strpages==null){
		pages=0;
	}else{
		pages=Integer.parseInt(strpages);
	}
	rs.last();
	int sqan=13,i=0,fcount=0;
	int count=rs.getRow();
	int countpage=count/sqan;
	if(count%sqan>0) countpage=countpage+1;
	if(pages<0) pages=0;
	if(pages>countpage-1) pages=countpage-1;
		fcount=pages*sqan+1;
	int fpage=(count-fcount)/sqan+1;
		rs.absolute(fcount);
		rs.previous();
	if(!rs.next()){
%> 
  <tr align="center"> 
    <td height="40" colspan="13"  class="red12">û����Ҫ��ѯ��ͼ��</td> 
  </tr> 
  <%
	}
	rs.previous();
		while(rs.next()){
			idbook=rs.getString(1);
			bookname=rs.getString(2);
			author=rs.getString(3);
			outday=rs.getDate(4);
			details=rs.getString(5);
			cost=rs.getString(6);
			price=rs.getString(7);
			imageurl=rs.getString(8);
			stock=rs.getString(9);
			active=rs.getString(10);
			hotdeal=rs.getString(11);
			sale=rs.getString(12);
			categoryname=rs.getString(13);
			suppliername=rs.getString(14);
			
			idbook=books.outStr(idbook);
			bookname=books.outStr(bookname);
			author=books.outStr(author);
			details=books.outStr(details);
			cost=books.outStr(cost);
			price=books.outStr(price);
			imageurl=books.outStr(imageurl);
			stock=books.outStr(stock);
			sale=books.outStr(sale);
			categoryname=books.outStr(categoryname);
			suppliername=books.outStr(suppliername);
%> 
  <tr align="center"> 
    <td height="22" >&nbsp;<%=idbook%></td> 
    <td >&nbsp;<%=bookname%></td> 
    <td >&nbsp;<%=author%></td> 
    <td >&nbsp;<%=outday%></td> 
    <td >&nbsp;<%=cost%></td> 
    <td >&nbsp;<%=price%></td> 
    <td >&nbsp;<%=imageurl%></td> 
    <td >&nbsp;<%=stock%></td> 
    <td >&nbsp;<%=sale%></td> 
    <td >&nbsp;<%=active%></td> 
    <td >&nbsp;<%=hotdeal%></td> 
    <td >&nbsp;<%=categoryname%></td> 
    <td >&nbsp;<%=suppliername%></td> 
  </tr> 
  <%
	i++;if(i==sqan) break;
	}
	books.close();
	pageContext.removeAttribute("books");
	if(countpage==1){
%> 
  <tr align="right"> 
    <td height="27" colspan="13"><table width="820"  border="0" cellspacing="0" cellpadding="0"> 
        <tr align="center"> 
          <td width="507" height="27" >&nbsp;</td> 
          <td width="46"><a href="#">��ҳ</a></td> 
          <td width="60">&nbsp;<a href="#">��һҳ</a></td> 
          <td width="61" >&nbsp;<a href="#">��һҳ</a></td> 
          <td width="46" >&nbsp;<a href="#">βҳ</a>&nbsp;</td> 
          <td width="56" >��1/1ҳ&nbsp;</td> 
          <td width="80" >��<%=count%>����¼</td> 
        </tr> 
      </table> 
  </tr> 
  <%
	}else{
%> 
  <tr align="right"> 
    <td height="27" colspan="13"> <table width="820"  border="0" cellspacing="0" cellpadding="0"> 
        <tr align="center"> 
          <td width="507" height="27" >&nbsp;</td> 
          <td width="46"><a href="books_select_save.jsp?pages=0">��ҳ</a></td> 
          <td width="60">&nbsp;<a href="books_select_save.jsp?pages=<%=(pages-1)%>">��һҳ</a></td> 
          <td width="61" >&nbsp;<a href="books_select_save.jsp?pages=<%=(pages+1)%>">��һҳ</a></td> 
          <td width="46" >&nbsp;<a href="books_select_save.jsp?pages=<%=countpage%>">βҳ</a>&nbsp;</td> 
          <td width="56" >��<%=(pages+1)%>/<%=countpage%>ҳ&nbsp;</td> 
          <td width="80" >��<%=count%>����¼</td> 
        </tr> 
      </table> 
  </tr> 
  <%
	}
%> 
</table> 
</body>
</html>
