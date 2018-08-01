<%@ page language="java" contentType="text/html;charset=GB2312" import="java.util.*"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt"%>
<html>
  <head>
    <title>订单明细列表页面</title>

  </head>
  
  <body>
	  <table width="100%"  border="0">
	  <caption>
	  <b>${user.uname}</b> 的订单明细表
	  </caption>
	  <tr>
	    <td>图书名称</td>
	    <td>价格</td>
	    <td>数量</td>
	    <td>状态</td>
	    <td>&nbsp;</td>
	  </tr>
	  <c:forEach var="o" items="${orderdetails}">
	  <tr>
	    <td>${o.bname}</td>
	    <td>${o.price}</td>
	    <td>${o.num}</td>
	    <td>${o.status}</td>
	    <td><c:if test="${sessionScope.user.userID!=1001}">
	    <a href="deleteorderdetailServlet?orderdetailID=${o.orderdetailno}">删除</a>
	    </c:if>
	    </td>
	  </tr>
	  </c:forEach>
	</table>
  </body>
</html>

