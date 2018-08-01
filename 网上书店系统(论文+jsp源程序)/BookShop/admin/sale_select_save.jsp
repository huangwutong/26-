<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����״����ѯ</title>
<jsp:useBean id="books" class="BookShop.MyDb" scope="page"/><link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<script language="javascript" src="../css/bs.js"></script>
</head>
<body> 
<%! String begin,end,idbook,categoryname,suppliername,bookname;
	int stock,quantity;
%> 
<table width="700" border="1" align="center" cellpadding="-1" cellspacing="0" bordercolor="#ffffff" bordercolorlight="#0066ff" bordercolordark="#ffffff"> 
  <tr> 
    <th width="93" height="22" >ͼ����</th> 
    <th width="174" >ͼ������</th> 
    <th width="128" >���</th> 
    <th width="140" >��Ӧ��</th> 
    <th width="73" >�۳�</th> 
    <th width="78" >���</th> 
  </tr> 
  <%	
	begin=(String)request.getParameter("begin");
	end=(String)request.getParameter("end");
	
	begin=books.inStr(begin);
	end=books.inStr(end);
	
	String sqls="SELECT b.idbook ,b.bookname ,sum(quantity) AS quantity,b.stock,c.categoryname,d.suppliername FROM salebook AS a,books AS b,category AS c,supplier AS d WHERE (saletime BETWEEN  '"+begin+"' AND '"+end+"') and a.idbook=b.idbook and b.idsupplier=d.idsupplier and b.idcategory=c.idcategory GROUP BY b.idbook ,b.stock,b.bookname,c.categoryname,d.suppliername";
	
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
    <td height="40" colspan="6"  class="red12">û����Ҫ��ѯ������״��</td> 
  </tr> 
  <%
	}
	rs.previous();
		while(rs.next()){
			idbook=rs.getString(1);
			bookname=rs.getString(2);
			quantity=rs.getInt(3);
			stock=rs.getInt(4);
			categoryname=rs.getString(5);
			suppliername=rs.getString(6);
			
			idbook=books.outStr(idbook);
			bookname=books.outStr(bookname);
			categoryname=books.outStr(categoryname);
			suppliername=books.outStr(suppliername);
%> 
  <tr align="center"> 
    <td height="22" >&nbsp;<%=idbook%></td> 
    <td >&nbsp;<%=bookname%></td> 
    <td >&nbsp;<%=categoryname%></td> 
    <td >&nbsp;<%=suppliername%></td> 
    <td >&nbsp;<%=quantity%></td> 
    <td >&nbsp;<%=(stock-quantity)%></td> 
  </tr> 
  <%
	i++;if(i==sqan) break;
	}
	books.close();
	pageContext.removeAttribute("books");
	if(countpage==1){
%> 
  <tr align="right"> 
    <td height="27" colspan="6"><table width="700"  border="0" cellspacing="0" cellpadding="0"> 
        <tr align="center"> 
          <td width="361" height="27" >&nbsp;</td> 
          <td width="46"><a href="#">��ҳ</a></td> 
          <td width="60">&nbsp;<a href="#">��һҳ</a></td> 
          <td width="58" >&nbsp;<a href="#">��һҳ</a></td> 
          <td width="48" >&nbsp;<a href="#">βҳ</a>&nbsp;</td> 
          <td width="58" >��1/1ҳ&nbsp;</td> 
          <td width="69" >��<%=count%>����¼</td> 
        </tr> 
      </table> 
  </tr> 
<%
	}else{
%>
  <tr align="right"> 
    <td height="27" colspan="6"><table width="700"  border="0" cellspacing="0" cellpadding="0"> 
        <tr align="center"> 
          <td width="361" height="27" >&nbsp;</td> 
          <td width="46"><a href="sale_select_save.jsp?pages=0">��ҳ</a></td> 
          <td width="60">&nbsp;<a href="sale_select_save.jsp?pages=<%=(pages-1)%>">��һҳ</a></td> 
          <td width="58" >&nbsp;<a href="sale_select_save.jsp?pages=<%=(pages+1)%>">��һҳ</a></td> 
          <td width="48" >&nbsp;<a href="sale_select_save.jsp?pages=<%=countpage%>">βҳ</a>&nbsp;</td> 
          <td width="58" >��<%=(pages+1)%>/<%=countpage%>ҳ&nbsp;</td> 
          <td width="69" >��<%=count%>����¼</td> 
        </tr> 
      </table> 
  </tr> 
<%
	}
%>
</table> 
</body>
</html>
