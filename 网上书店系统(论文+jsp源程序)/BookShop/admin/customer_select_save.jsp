<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��Ա״����ѯ</title>
<jsp:useBean id="books" class="BookShop.MyDb" scope="page"/>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<script language="javascript" src="../css/bs.js"></script>
</head>
<body> 
<%! String idcustomer,username,phone,email,saletime,bookname,price,countprice,discount;
	int quantity;
%>
<table width="779" border="1" align="center" cellpadding="-1" cellspacing="0" bordercolor="#ffffff" bordercolorlight="#0066ff" bordercolordark="#ffffff">
  <tr>
    <th width="138" height="22" >��ԱID</th>
    <th width="87" >��Ա����</th>
    <th width="91" >����ʱ��</th>
    <th width="180" >��������</th>
    <th width="59" >����</th>
    <th width="36" >����</th>
    <th width="72" >�ܼ�</th>
    <th width="98" >���ۺ�</th>
  </tr>
  <%	
	idcustomer=(String)request.getParameter("idcustomer");
	username=(String)request.getParameter("username");
	phone=(String)request.getParameter("phone");
	email=(String)request.getParameter("email");
	
	idcustomer=books.inStr(idcustomer);
	username=books.inStr(username);
	phone=books.inStr(phone);
	email=books.inStr(email);

	idcustomer=books.selectStr(idcustomer);
	username=books.selectStr(username);
	phone=books.selectStr(phone);
	email=books.selectStr(email);
	
	String sqls="SELECT b.idcustomer,b.username,a.saletime,c.bookname,c.price,a.quantity,(c.price * a.quantity) as countprice ,a.disprice FROM salebook AS a,customers AS b,books AS c WHERE a.idcustomer=b.idcustomer AND c.idbook=a.idbook AND a.idcustomer "+idcustomer+" AND b.username"+username+" AND b.phone"+phone+" AND b.email  "+email;
	
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
	int sqan=25,i=0,fcount=0;
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
    <td height="40" colspan="8"  class="red12">û����Ҫ��ѯ�Ļ�Ա״��</td>
  </tr> 
<%
	}
	rs.previous();
		while(rs.next()){
			idcustomer=rs.getString(1);
			username=rs.getString(2);
			saletime=rs.getString(3);
			bookname=rs.getString(4);
			price=rs.getString(5);
			quantity=rs.getInt(6);
			countprice=rs.getString(7);
			discount=rs.getString(8);
			
			idcustomer=books.outStr(idcustomer);
			username=books.outStr(username);
			saletime=books.outStr(saletime);
			saletime=saletime.substring(0,10);
			bookname=books.outStr(bookname);
			price=books.outStr(price);
			countprice=books.outStr(countprice);
			discount=books.outStr(discount);
%>
  <tr align="center">
    <td height="22" >&nbsp;<%=idcustomer%></td>
    <td >&nbsp;<%=username%></td>
    <td >&nbsp;<%=saletime%></td>
    <td >&nbsp;<%=bookname%></td>
    <td >&nbsp;<%=price%></td>
    <td >&nbsp;<%=quantity%></td>
    <td >&nbsp;<%=countprice%></td>
    <td >&nbsp;<%=discount%></td>
  </tr>
  <%
	i++;if(i==sqan) break;
	}
	books.close();
	pageContext.removeAttribute("books");
	if(countpage==1){
%>
  <tr align="right"> 
    <td height="27" colspan="8"><table width="779"  border="0" cellspacing="0" cellpadding="0"> 
        <tr align="center"> 
          <td width="361" height="27" >&nbsp;</td> 
          <td width="46"><a href="#">��ҳ</a></td> 
          <td width="60"><a href="#">��һҳ</a></td> 
          <td width="58" ><a href="#">��һҳ</a></td> 
          <td width="48" ><a href="#">βҳ</a></td> 
          <td width="58" >��1/1ҳ</td> 
          <td width="69" >��<%=count%>����¼</td> 
        </tr> 
      </table> 
  </tr> 
<%
	}else{
%>
  <tr align="right"> 
    <td height="27" colspan="8"><table width="779"  border="0" cellspacing="0" cellpadding="0"> 
        <tr align="center"> 
          <td width="361" height="27" >&nbsp;</td> 
          <td width="46"><a href="customer_select_save.jsp?pages=0">��ҳ</a></td> 
          <td width="60"><a href="customer_select_save.jsp?pages=<%=(pages-1)%>">��һҳ</a></td> 
          <td width="58" ><a href="customer_select_save.jsp?pages=<%=(pages+1)%>">��һҳ</a></td> 
          <td width="48" ><a href="customer_select_save.jsp?pages=<%=countpage%>">βҳ</a></td> 
          <td width="58" >��<%=(pages+1)%>/<%=countpage%>ҳ</td> 
          <td width="69" >��<%=count%>����¼</td> 
        </tr> 
      </table> 
  </tr> 
<%
	}
%>
</table>
<table width="779" border="0" align="center">
  <tr>
    <td width="709" height="41">&nbsp;</td>
    <td width="60" align="center" valign="bottom" scope="col"><a href="#" style="cursor:hand" onClick="javascript:history.back()">����</a></td>
  </tr>
</table>
</body>
</html>
