<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
        function AlertDel() {
	if (confirm("确定要删除此人记录吗")) return(true);
	else return(false);
}
</script>
<script type="javascript" src="../yjj.js"></script>
   <style type="text/css">
       body,table{
    font-size:12px;
}
table{
    table-layout:fixed;
    empty-cells:show; 
    border-collapse: collapse;
    margin:0 auto;
   
}
td{
    height:20px;
}
</style>
<style>
		a:link {text-decoration: none;}
		a:visited {text-decoration: none;}
		a:active {text-decora tion: none;}
		a:hover {text-decoration: none;}
</style>

  </head>
  
  <body>
       <table border="1" width="100%">
              <tr>
                  <td colspan="4">您当前位置&gt;&gt;会员管理</td>
              </tr>
              <tr align="center" >
                  <td><strong>会员名</strong></td>
                  <td><strong>真实姓名</strong></td>
                  <td><strong>注册日期</strong></td>
                  <td><strong>相关操作</strong></td>
              </tr>
              
              <c:forEach items="${requestScope.userList}" var="map">
              <tr align="center">
                  <td>${map['userName'] }</td>
                  <td>${map['name'] }</td>
                  <td>${ map['regDate']}</td>
                  <td><a href="servlet/UserManageServlet?action=delete&id=${map['userId'] }" onclick="return AlertDel()">删除</a> <a href="servlet/UserManageServlet?action=selectById&id=${map['userId'] }">详细信息</a></td>
              </tr>
              
              </c:forEach>
              
              <tr>
                  
                  <td colspan="4" align="center"><a href="servlet/UserManageServlet?action=select">首页</a>&nbsp;&nbsp;<a href="servlet/UserManageServlet?action=page&page=${requestScope.befPage }">上一页</a>&nbsp;&nbsp;<a href="servlet/UserManageServlet?action=page&page=${requestScope.nextPage}">下一页</a>&nbsp;&nbsp;<a href="servlet/UserManageServlet?action=page&page=${ requestScope.pb.sumPage}">尾页</a>&nbsp;&nbsp;共${requestScope.pb.sumSava }条记录</td>
              </tr>
       </table>
  </body>
</html>
