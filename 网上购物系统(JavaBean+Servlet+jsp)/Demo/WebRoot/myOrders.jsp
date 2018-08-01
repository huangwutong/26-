<%@ page language="java" contentType="text/html;charset=GBK" import="java.util.*" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt"%>

<html>
  <head>
    <title>订单列表页面</title>
  </head>
  
  <body>
	 <table width="100%"  border="0">
	  <caption>
	  ${userinfo.uname}的订单
	  </caption>
	  <tr>
	    <td>订单序号</td>
	    <td>订单状态</td>
	    <td>订购日期</td>
	    <td>客户姓名</td>
	    <td>&nbsp;</td>
	  </tr>
	  <c:forEach var="o" items="${orders}">
	  <tr>
	    <td>${o.orderno}</td>
	    <td>${o.status}</td>
	    <td>${o.orderdate}</td>
	    <td>${o.uname}</td>	   
	  </tr>
	  </c:forEach>
	</table>

  </body>
</html>
	