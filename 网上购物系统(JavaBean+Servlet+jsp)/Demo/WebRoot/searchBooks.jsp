<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'searchBooks.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   
		<hr size="2" color="blue">		
		<center><font size="6" color="blue">图书查找信息</font></center>
		<table border="1" width="100%">
			<c:if test="${booklist!=null}">
				<tr style="color: red;">
					<td>
						书籍ID
					</td>
					<td>
						类别ID
					</td>
					<td>
						书籍名称
					</td>
					<td>
						作者
					</td>
					<td>
						出版日期
					</td>
					<td>
						出版者
					</td>
					<td>
						备注
					</td>
					<td>
						价格
					</td>
					<c:if test="${sessionScope.user!=null}">
					<td>
						操作
					</td>
					</c:if>
				</tr>
				
				<c:forEach var="book" items="${booklist}">
					<tr>
						<td>
							${book.bookno}
						</td>
						<td>
							${book.crono}
						</td>
						<td>
							${book.bname}
						</td>
						<td>
							${book.author}
						</td>
						<td>
							${book.pdate}
						</td>
						<td>
							${book.publisher}
						</td>
						<td>
							${book.remark}
						</td>
						<td>
							${book.price}
						</td>
							<c:if test="${sessionScope.user!=null}">
					<td>
						<a href="addCartServlet?bookno=${book.bookno}&crono=${book.crono}">加入购物车</a>
					</td>
					</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<hr size="2" color="blue">
  </body>
</html>
