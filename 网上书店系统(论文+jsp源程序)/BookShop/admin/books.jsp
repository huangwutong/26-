<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>ͼ�����</title>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<jsp:useBean id="book" scope="page" class="BookShop.MyDb" /></head>
</head>

<body>
<p>&nbsp;</p>
<table width="532" border="1" align="center" cellpadding="-1" cellspacing="0" bordercolor="#ffffff" bordercolorlight="#0066ff" bordercolordark="#ffffff">
  <caption >
  <div class="two">
<%
	String success=(String)session.getAttribute("success");
		if(success!=null){
			out.println(success);
			session.removeAttribute("success");
		}else{
			out.print("ͼ�����");		
		}
%><p></p></div>
  </caption>
  <tr>
    <td height="22" colspan="4" align="center"><a href="books_add.jsp">������ͼ��</a></td>
  </tr>
  <tr>
    <td width="181" height="22" align="center">ͼ����</td>
    <td height="22" colspan="3" align="center">ͼ������</td>
  </tr>
<%
	String sqls="SELECT idbook,bookname FROM books ORDER BY idbook";
	Statement stmt=book.getstmtread();
	ResultSet rs=stmt.executeQuery(sqls);
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
	int sqan=18,i=0,fcount=0;
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
    <td height="40" colspan="5"  class="red12">����ͼ��</td>
  </tr> 
<%
	}
	rs.previous();
		while(rs.next()){
			String idbook=rs.getString("idbook");
			String bookname=rs.getString("bookname");
			idbook=book.outStr(idbook);
			bookname=book.outStr(bookname);
%>
  <tr>
    <td height="22" align="center" ><%=idbook%></td>
   <td width="307" height="22" align="left"><a href="bookmsg.jsp?idbook=<%=idbook%>" title="�鿴ͼ����Ϣ"><%=bookname%></a>&nbsp;</td>
    <td width="36" align="center" ><a href="books_del.jsp?idbook=<%=idbook%>" ><img src="../image/emptybuycar.gif" width="20" height="20" border="0" alt="ɾ��"></a></td>
  </tr>
<%
	i++;if(i==sqan) break;
		}
	book.close();
	pageContext.removeAttribute("book");
%>	
<tr align="right">
<td height="22" colspan="4"><a href="books.jsp?pages=1">��ҳ</a>&nbsp;<a href="books.jsp?pages=<%=(pages-1)%>">��һҳ</a>&nbsp;<a href="books.jsp?pages=<%=(pages+1)%>">��һҳ</a>&nbsp;<a href="books.jsp?pages=<%=countpage%>">βҳ</a>&nbsp;��<%=(pages+1)%>/<%=countpage%>ҳ&nbsp;��<%=count%>����¼</td>
</tr>
</table>
</body>
</html>
