<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>图书管理</title>
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
			out.print("图书管理");		
		}
%><p></p></div>
  </caption>
  <tr>
    <td height="22" colspan="4" align="center"><a href="books_add.jsp">增加新图书</a></td>
  </tr>
  <tr>
    <td width="181" height="22" align="center">图书编号</td>
    <td height="22" colspan="3" align="center">图书名称</td>
  </tr>
<%
	String sqls="SELECT idbook,bookname FROM books ORDER BY idbook";
	Statement stmt=book.getstmtread();
	ResultSet rs=stmt.executeQuery(sqls);
	String color="";
	//countpage总页数，sqan宽度，count总纪录数,fpage现在页,fcount现纪录数
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
    <td height="40" colspan="5"  class="red12">暂无图书</td>
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
   <td width="307" height="22" align="left"><a href="bookmsg.jsp?idbook=<%=idbook%>" title="查看图书信息"><%=bookname%></a>&nbsp;</td>
    <td width="36" align="center" ><a href="books_del.jsp?idbook=<%=idbook%>" ><img src="../image/emptybuycar.gif" width="20" height="20" border="0" alt="删除"></a></td>
  </tr>
<%
	i++;if(i==sqan) break;
		}
	book.close();
	pageContext.removeAttribute("book");
%>	
<tr align="right">
<td height="22" colspan="4"><a href="books.jsp?pages=1">首页</a>&nbsp;<a href="books.jsp?pages=<%=(pages-1)%>">上一页</a>&nbsp;<a href="books.jsp?pages=<%=(pages+1)%>">下一页</a>&nbsp;<a href="books.jsp?pages=<%=countpage%>">尾页</a>&nbsp;第<%=(pages+1)%>/<%=countpage%>页&nbsp;共<%=count%>条纪录</td>
</tr>
</table>
</body>
</html>
