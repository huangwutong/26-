<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>增加图书</title>
<jsp:useBean id="books" class="BookShop.MyDb" scope="page"/>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
</head>
<%! String cost,idbook,price,bookname,outday,author,details,imageurl;
	int stock,idcategory,idsupplier;
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
	String sqls="SELECT idbook FROM books WHERE idbook='"+idbook+"'";
	String sqli="INSERT INTO books(idbook,bookname,outday,idcategory,idsupplier,author,cost,stock,price,details,active,hotdeal,imageurl) VALUES('"+idbook+"','"+bookname+"','"+outday+"',"+idcategory+","+idsupplier+",'"+author+"',"+cost+","+stock+","+price+",'"+details+"',"+active+","+hotdeal+",'"+imageurl+"')";
	int temp=-2;
	temp=books.select(sqls);
	if(temp>0){
		session.setAttribute("error","图书编号重复");
		response.sendRedirect("../error/errorpage.jsp");
	}else{
		temp=0;
		temp=books.update(sqli);
		if(temp>0){
			session.setAttribute("success","添加成功");	
		}else{
			session.setAttribute("success","添加失败");	
		}
			response.sendRedirect("books.jsp");
	}
	pageContext.removeAttribute("books");
%>
</html>
