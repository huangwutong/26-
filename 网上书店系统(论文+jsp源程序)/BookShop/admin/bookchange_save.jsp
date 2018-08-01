<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="BookShop.MyDb"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>修改图书</title>
<jsp:useBean id="books" class="BookShop.MyDb" scope="page"/>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
</head>
<%! String cost,idbook,price,bookname,outday,author,details,imageurl;
	int stock,idcategory,idsupplier,sale;
%>
<% 	int active=0,hotdeal=0;
	idbook=(String)request.getParameter("idbook");
	bookname=(String)request.getParameter("bookname");
	outday=(String)request.getParameter("outday");
	author=(String)request.getParameter("author");
	details=(String)request.getParameter("details");
	cost=(String)request.getParameter("cost");
	price=(String)request.getParameter("price");
	imageurl=(String)request.getParameter("imageurl");
	idcategory=Integer.parseInt((String)request.getParameter("idcategory"));
	idsupplier=Integer.parseInt((String)request.getParameter("idsupplier"));
	stock=Integer.parseInt((String)request.getParameter("stock"));
	sale=Integer.parseInt((String)request.getParameter("sale"));
	try{
	active=Integer.parseInt((String)request.getParameter("active"));
	}catch(Exception e){
	}
	try{
	hotdeal=Integer.parseInt((String)request.getParameter("hotdeal"));
	}catch(Exception e){
	}
	
	idbook=books.inStr(idbook);
	bookname=books.inStr(bookname);
	outday=books.inStr(outday);
	author=books.inStr(author);
	details=books.inStr(details);
	imageurl=books.inStr(imageurl);
	String sqls="SELECT stock FROM books WHERE idbook='"+idbook+"'";
	String sqlu="UPDATE books SET bookname='"+bookname+"',outday='"+outday+"',idcategory="+idcategory+",idsupplier="+idsupplier+",author='"+author+"',cost="+cost+",stock="+stock+",price="+price+",details='"+details+"',active="+active+",hotdeal="+hotdeal+",imageurl='"+imageurl+"',sale="+sale+" WHERE idbook='"+idbook+"'";
	int temp=-2;
	Statement stmt=books.getstmtread();
	ResultSet rs=stmt.executeQuery(sqls);
		if(rs.next()){
			temp=rs.getInt(1);
		}
		books.close();
		if(temp>stock){
			session.setAttribute("error","您修改的数量不能小于以前图书数量");
			response.sendRedirect("../error/errorpage.jsp");
			return;
		}
		temp=books.update(sqlu);
		if(temp>0){
			response.sendRedirect("bookmsg.jsp?idbook="+idbook);
		}
	pageContext.removeAttribute("books");
%>
</html>
