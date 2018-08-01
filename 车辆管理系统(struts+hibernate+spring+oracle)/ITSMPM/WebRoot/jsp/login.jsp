<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html >
	<head>
     <title>车辆管理系统登录页面</title>
     <link rel="stylesheet" href="<%=request.getContextPath() %>/css/pages.css" type="text/css"></link>
	</head>

	<body>
	 <div style="position: absolute;top: 200px;left: 400px">
	   <s:form action="userlogin"  theme="simple" method="post">
	   <table border="0">
	   <tr>
	    <td>用户名：</td><td><input type="text" name="username" value=""/></td>
	   </tr>
	   <tr>
	    <td>密码：</td><td><input type="password" name="password" value=""/></td>
	   </tr>
	   <tr>
         <td></td>
         <td >
          <input type="submit" value="登 录" class="submitButton" />
          <input type="submit" value="注册" src="regist.jsp"/>
         </td>
        </tr>
	   </table>
	   
	   </s:form>
	 </div> 
	</body>
</html>
