<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="../error/error.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>图书索引查询</title>
<jsp:useBean id="books" class="BookShop.MyDb" scope="page"/>
<jsp:useBean id="time" class="BookShop.MyTime" scope="page"/>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<script language="javascript" src="../css/bs.js"></script>
</head>
<body> 
<%!
	String idbook,bookname,category,supplier,author,active,hotdeal,outday,details,cost,price,imageurl,categoryname,suppliername,select1,text,text1,text2;
	int sale,select,stock;
%> 
<table width="825" height="63" border="0" align="center"> 
  <%
	try{
		select=Integer.parseInt((String)request.getParameter("select"));
	}catch(Exception e){
		select=1;
	}
	try{
		select1=(String)request.getParameter("select1");
	}catch(Exception e){
		select1="1";
	}
	try{
		text=(String)request.getParameter("text");
	}catch(Exception e){
		text="";
	}
	try{
		text1=(String)request.getParameter("text1");
	}catch(Exception e){
		text1="";
	}
	try{
		text2=(String)request.getParameter("text2");
	}catch(Exception e){
		text2=time.getDay();
	}
%> 
  <form name="form1" method="post" action="indselect.jsp"> 
    <tr> 
      <td>根据
        <select name="select" onChange="javascript:submit()"> 
          <option value="1" <%if(select==1)out.print("selected");%>>图书编号</option> 
          <option value="2" <%if(select==2)out.print("selected");%>>图书名称</option> 
          <option value="3" <%if(select==3)out.print("selected");%>>作者</option> 
          <option value="4" <%if(select==4)out.print("selected");%>>类别</option> 
          <option value="5" <%if(select==5)out.print("selected");%>>供应商</option> 
          <option value="6" <%if(select==6)out.print("selected");%>>出版时间</option> 
          <option value="7" <%if(select==7)out.print("selected");%>>售价</option> 
          <option value="8" <%if(select==8)out.print("selected");%>>发布书</option> 
          <option value="9" <%if(select==9)out.print("selected");%>>热点书</option> 
        </select> 
        查询图书&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <%
	if(select==6||select==7){
%> 
        <input name="text1" type="text" size="20"> 
&nbsp;至&nbsp; 
        <input name="text2" type="text" size="20"> 
&nbsp;之间
        <%
	}else if(select==8||select==9){
		try{
			if(select1==null){
			select1="1";
			}
%> 
        <select name="select1" onChange="javascript:submit()"> 
          <option value="1" <%if(select1.equals("1"))out.print("selected");%>>是</option> 
          <option value="0" <%if(select1.equals("0"))out.print("selected");%>>否</option> 
        </select> 
        <%
		}catch(Exception e){}
	}else{
%> 
        <input type="text" name="text"> 
        <%
	}
%> 
        <input type="submit" name="Submit" value="查找"></td> 
    </tr> 
  </form> 
</table> 
<table width="825" border="1" align="center" cellpadding="-1" cellspacing="0" bordercolor="#ffffff" bordercolorlight="#0066ff" bordercolordark="#ffffff"> 
  <tr> 
    <th width="65" height="22" >图书编号</th> 
    <th width="102" height="22" >图书名称</th> 
    <th width="48" height="22" >作者</th> 
    <th width="94" height="22" >出版时间</th> 
    <th width="35" height="22" >售价</th> 
    <th width="67" height="22" >图书封面</th> 
    <th width="53" height="22" >库存</th> 
    <th width="43" height="22" >售出</th> 
    <th width="43" height="22" >发布书</th> 
    <th width="48" height="22" >热点书</th> 
    <th width="89" height="22" >类别</th> 
    <th width="112" height="22" >供应商</th> 
  </tr> 
  <%
	idbook=(String)request.getParameter("idbook");
	bookname=(String)request.getParameter("bookname");
	category=(String)request.getParameter("category");
	supplier=(String)request.getParameter("supplier");
	author=(String)request.getParameter("author");
	active=(String)request.getParameter("active");
	hotdeal=(String)request.getParameter("hotdeal");
	switch(select){
		case 1:idbook=text;break;
		case 2:bookname=text;break;
		case 3:author=text;break;
		case 4:category=text;break;
		case 5:supplier=text;break;
		case 8:active=select1;break;
		case 9:hotdeal=select1;break;		
	}
	idbook=books.inStr(idbook);
	bookname=books.inStr(bookname);
	author=books.inStr(author);
	category=books.inStr(category);
	supplier=books.inStr(supplier);
	active=books.inStr(active);
	hotdeal=books.inStr(hotdeal);
	text1=books.inStr(text1);
	text2=books.inStr(text2);
	if(text2.equals("")) text2=time.getDay();
	
	idbook=books.selectStr(idbook);
	bookname=books.selectStr(bookname);
	category=books.selectStr(category);
	author=books.selectStr(author);
	supplier=books.selectStr(supplier);
	active=books.selectStr(active);
	hotdeal=books.selectStr(hotdeal);
	
	String sqls="SELECT idbook,bookname,author,outday,details,cost,price,imageurl,stock,active,hotdeal,sale,categoryname,suppliername FROM books as a,category as b,supplier as c  WHERE idbook "+idbook+" AND bookname "+bookname+" AND categoryname "+category+" AND author "+author+" AND (outday>='"+text1+"' AND outday<='"+text2+"') AND suppliername "+supplier+" AND active "+active+" AND hotdeal "+hotdeal+" AND a.idcategory=b.idcategory AND a.idsupplier=c.idsupplier";
//	String sqls="SELECT idbook,bookname,author,outday,details,cost,price,imageurl,stock,active,hotdeal,sale,categoryname,suppliername FROM books as a,category as b,supplier as c  WHERE idbook "+idbook+" AND bookname "+bookname+" AND categoryname "+category+" AND author "+author+" AND suppliername "+supplier+" AND active "+active+" AND hotdeal "+hotdeal+" AND a.idcategory=b.idcategory AND a.idsupplier=c.idsupplier";
	Statement stmt=books.getstmtread();
	ResultSet rs=stmt.executeQuery(sqls);
	if(!rs.next()){
  		out.print("<tr>");
    	out.print("<td height='40'  colspan='13'  align='center' class='red12'>没有您要查询的结果</td>"); 
 	 	out.print("</tr>");
		books.close();
		return;
	}
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
	int sqan=1,i=0,fcount=0;
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
  <tr> 
    <td height="40"  colspan="13"  align="center" class="red12">没有您要查询的结果</td> 
  </tr> 
  <%
	}else{
		rs.previous();
		while(rs.next()){
			idbook=rs.getString(1);
			bookname=rs.getString(2);
			author=rs.getString(3);
			outday=rs.getString(4);
			details=rs.getString(5);
			cost=rs.getString(6);
			price=rs.getString(7);
			imageurl=rs.getString(8);
			stock=rs.getInt(9);
			active=rs.getString(10);
			hotdeal=rs.getString(11);
			sale=rs.getInt(12);
			categoryname=rs.getString(13);
			suppliername=rs.getString(14);
			
			idbook=books.outStr(idbook);
			bookname=books.outStr(bookname);
			author=books.outStr(author);
			outday=books.outStr(outday);
			outday=outday.substring(0,10);
			details=books.outStr(details);
			cost=books.outStr(cost);
			price=books.outStr(price);
			imageurl=books.outStr(imageurl);
			categoryname=books.outStr(categoryname);
			suppliername=books.outStr(suppliername);
%> 
  <tr align="center"> 
    <td height="22" >&nbsp;<%=idbook%></td> 
    <td >&nbsp;<%=bookname%></td> 
    <td >&nbsp;<%=author%></td> 
    <td >&nbsp;<%=outday%></td> 
    <td >&nbsp;<%=price%></td> 
    <td >&nbsp;<%=imageurl%></td> 
    <td >&nbsp;<%=(stock-sale)%></td> 
    <td >&nbsp;<%=sale%></td> 
    <td >&nbsp;<%=active%></td> 
    <td >&nbsp;<%=hotdeal%></td> 
    <td >&nbsp;<%=categoryname%></td> 
    <td >&nbsp;<%=suppliername%></td> 
  </tr> 
  <%
		i++;
		}//while
	}
	books.close();
	pageContext.removeAttribute("books");
%> 
</table> 
</body>
</html>
