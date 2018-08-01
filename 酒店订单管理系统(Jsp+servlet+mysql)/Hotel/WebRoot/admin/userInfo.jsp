<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
    <link href="css/show.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>
         <table class="table1" align="center" width="100%">
                <tr>
                    <td width="30%" align="right"><strong>用户名:</strong></td>
                    <td width="70%" >${requestScope.user.userName }</td>
                </tr>
                
                <tr>
                    <td align="right"><strong>密码:</strong></td>
                    <td>${requestScope.user.password }</td>
                </tr>
                
                <tr>
                    <td align="right"><strong>真实姓名:</strong></td>
                    <td>${requestScope.user.name }</td>
                </tr>
                
                <tr>
                    <td align="right"><strong>联系电话:</strong></td>
                    <td>${requestScope.user.tel }</td>
                </tr>
                
                <tr>
                    <td align="right"><strong>电子信箱:</strong></td>
                    <td>${requestScope.user.email }</td>
                </tr>
                
                <tr>
                    <td align="right"><strong>性别:</strong></td>
                    <td>${requestScope.user.sex }</td>
                </tr>
                
                <tr >
                    <td align="right"><strong>注册日期:</strong></td>
                    <td>${requestScope.user.regDate }</td>
                </tr>
                
                <tr>
                    <td align="right"><strong>积分:</strong></td>
                    <td>${requestScope.user.jifen }</td>
                </tr>
         </table>
  </body>
</html>
