<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户管理</title>
    
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
    <h2>职员列表</h2>
    <p>当前第${currentPage}页/共${maxPage}页</p>
    <table border="1" width="50%" cellspacing="0" cellpadding="4">
       <tr>
         <th>姓名</th><th>登录名</th><th>密码</th><th>员工状态</th><th>部门</th><th>职位</th>
       </tr>
       <c:forEach items="${userList}" var="user">
         <tr>
           <td>${user.name}</td>
           <td>${user.loginName}</td>
           <td>${user.password}</td>
           <td>${user.userStateId.userStateName}</td>
           <td>${user.deptPositionId.deptId.deptName}</td>
           <td>${user.deptPositionId.positionId.positionName}</td>
         </tr>
       </c:forEach>
    </table>
    <p>
    <c:if test="${currentPage eq 1}">
        首页&nbsp;&nbsp;上一页&nbsp;&nbsp;
    </c:if>
    <c:if test="${currentPage gt 1}">
       <a href="user.do?operate=doShow">首页</a>&nbsp;&nbsp;
       <a href="user.do?operate=doShow&page=${currentPage - 1}">上一页</a>&nbsp;&nbsp;
    </c:if>
    <c:if test="${currentPage eq maxPage}">
      下一页&nbsp;&nbsp;尾页
    </c:if>
    <c:if test="${currentPage lt maxPage}">
       <a href="user.do?operate=doShow&page=${currentPage + 1}">下一页</a>&nbsp;&nbsp;
       <a href="user.do?operate=doShow&page=${maxPage}">尾页</a>
    </c:if>
    </p>
  </body>
</html>
