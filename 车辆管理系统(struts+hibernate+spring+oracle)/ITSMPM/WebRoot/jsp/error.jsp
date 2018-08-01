<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'error.jsp' starting page</title>
     <link rel="stylesheet" href="<%=request.getContextPath()%>/css/pages.css" type="text/css"></link>
  </head>
  <body>
   <div style="position: absolute;left: 300px;top: 100px">
    <FONT color="red" size="3"><s:actionerror/></FONT>
      <input type="button"  value="确 定" class="submitButton" onclick="window.history.go(-1);"/>
   </div>
  </body>
</html>
