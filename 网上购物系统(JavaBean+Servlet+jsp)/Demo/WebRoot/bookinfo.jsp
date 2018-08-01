<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<jsp:useBean id="booklist" class="test.service.BookServiceImpl"></jsp:useBean>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'bookinfo.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>
	
   <script type="text/javascript">
  function checkField(){
  
  if(document.books.crono.value=="")
  		{
  		alert("请输入你的类别号");
  		
  		document.books.crono.focus();
  		return false;
  		}
  if(document.books.bname.value=="")
  		{
  		alert("请输入你的书籍名");
  		document.books.bname.focus();
  		return false;
  		}
   if(document.books.author.value=="")
  		{
  		alert("请输入作者");
  		document.books.author.focus();
  		return false;
  		}		
  	 if(document.books.pdate.value=="")
  		{
  		alert("请输入出版日期");
  		document.books.pdate.focus();
  		return false;
  		}	
  	 if(document.books.publisher.value=="")
  		{
  		alert("请输入出版者");
  		document.books.publisher.focus();
  		return false;
  		}
  	 if(document.books.remark.value=="")
  		{
  		alert("请输入备注");
  		document.books.remark.focus();
  		return false;
  		}				
   if(document.books.price.value=="")
  		{
  		alert("请输入价格");
  		document.books.price.focus();
  		return false;
  		}	
  }
	
  </script>	

	<body bgcolor="#eeffff">
		<a href="index.jsp?page=manage.jsp">管理界面</a>
		<hr size="2" color="blue">		
		<center><font size="6" color="blue">图书信息管理</font></center>
		<table border="1" width="100%">
			<c:if test="${booklist.bookListInfo!=null}">
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
					<td>
					操作
				</td>
				</tr>
				<c:forEach var="book" items="${booklist.bookListInfo}">
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
						
						<td>
							<a href="delBookInfo?bookno=${book.bookno}">删除</a>&nbsp;
							<a href="#">更新</a>
						</td>
					</tr>



				</c:forEach>
			</c:if>
		</table>
		<hr size="2" color="blue">

		<form action="addBookInfo" method="post" name="books"> 
			类别号: &nbsp; 
			<input type="text" name="crono" /><br><br>
			书籍名称: 
			<input type="text" name="bname" /><br><br>
			作者: &nbsp; &nbsp; 
			<input type="text" name="author" /><br><br>
			出版日期:
			<input type="text" name="pdate" /><br><br>
			出版者: &nbsp; 
			<input type="text" name="publisher" /><br><br>
			备注:&nbsp;&nbsp;&nbsp;&nbsp; 
			<input type="text" name="remark" /><br><br> 
			价格: &nbsp;&nbsp;&nbsp;
			<input type="text" name="price" /><br><br>
			<center><input type="submit" value="增加书籍" onclick="return checkField()" /></center>
		</form>
	</body>
</html>
