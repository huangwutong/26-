<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'ywfxResult.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/pages.css" type="text/css"></link>

  </head>
  
  <body>
   <div style="position: absolute;left: 200px;top: 100px">
     <font color="red" size="12"><s:actionmessage/></font>
   </div>
   <div style="position: absolute;left: 300px;top: 200px">
      <input type="button" onclick="window.location.href='/ITSMPM/user/rpshow.action'" name="Submit" value="确 定" class="submitButton "/>
   </div>
  </body>
</html>
