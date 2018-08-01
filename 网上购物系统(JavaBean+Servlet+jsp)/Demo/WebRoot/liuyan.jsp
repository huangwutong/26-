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
    
    <title>My JSP 'index.jsp' starting page</title>
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
 
 <center><font color="red" size="5">留言板</font></center>
 <hr size="2" color="pink" />
  <table border="1"  align="center">
   <tr bgcolor="yellow"><td>ID</td><td>标题</td><td>日期时间</td><td>内容</td><td>用户名</td></tr>
  <c:forEach  var="mess" items="${list}">
  <tr><td>${mess.message_id}</td><td>${mess.message_title}</td><td>${mess.message_date}</td>
  <td>${mess.message_content}</td><td>${mess.message_user}</td>
  </tr>
  </c:forEach>
  </table>
  <p>
 <hr size="2" color="pink" />
 
 
 <table width="100%"><tr><td>
		<CENTER>
		<a href="pageShowMessageList?currentPage=0" >第一页</a>
		<c:if test="${(currentPage-1)>=0}">
		<a href="pageShowMessageList?currentPage=${currentPage-1}&totalPage=${totalPage}" >上一页</a>
		</c:if>
		<c:if test="${(currentPage+1)<=(totalPage-1)}">
		<a href="pageShowMessageList?currentPage=${currentPage+1}&totalPage=${totalPage}" >下一页</a>
		</c:if>
		<a href="pageShowMessageList?currentPage=${totalPage-1}&totalPage=${totalPage}" >最后页</a>
		<font size="4" color="red"><b>当前页：${currentPage+1}&nbsp;
		总页数：${totalPage}
		</b></font>
		</CENTER>
		</td></tr></table>
		<hr size="2" color="blue">
 

   <form action="addMessage" method="post">标题
  <input type="text" name="title" />用户名
  <input type="text" name="user" />内容
  <input type="text"  name="content" />

  <input type="submit" value="提交" name="submit">
  <input type="reset" value="清除" name="reset">
  </form>
  </body>
</html>