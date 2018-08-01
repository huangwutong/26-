<%@ page language="java" pageEncoding="gbk"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
    <html:base />
    
    <title>index.jsp</title>

  </head>
  
  <body>
    <a href="/shoppingcenter/goodManager.do?method=show&goodname=1&goodtype=1">进入商城</a>
  	<jsp:include flush="true" page="/show/admin/left.jsp">
  		<jsp:param name="" value="" />
  		<jsp:param name="" value="" />
  	</jsp:include>
  </body>
</html:html>
