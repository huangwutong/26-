<%@ page language="java" contentType="text/html;charset=gb2312" import="java.util.*" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt"%>
<html>
  <head>
    <title>���ﳵ�б�ҳ��</title>
    	<style type="text/css">
		<!--
		.style4 {
			color: #0066FF;
			font-size: medium;
		}-->
		</style>
  </head>  
<body>
<center><font color="red" size="5">���ﳵ</font></center>
<hr color="blue" size="2">
    <table width="100%" border="0">
  <tr bgcolor="#CCCCCC">
    
    <td>
    <div align="center"><strong>�� ��</strong></div>
    </td>
    <td>
    <div align="center"><strong>�� ��</strong></div>
    </td>
 <td>
    <div align="center"><strong>�� ��</strong></div>
    </td>
    <td>
    <div align="center"><strong>С ��</strong></div>
    </td>
    
 </tr>
  <c:set var="total" value="0"></c:set>
  <c:forEach var="ci" items="${sessionScope.cartInfo}">
  
 
	 
	  <tr bgcolor="pink">
	    <td align="center">
	    ${ci.value.book.bname}
	    </td>
	    <td align="center">
	    ${ci.value.book.price}
	    </td>
	    <td>
	    <center><input name="num" type="text"  size="2" maxlength="2" value="${ci.value.num}"></center>
	    </td>
	   
		<td>
		
	 <div align="center">
	 <fmt:formatNumber type="currency"value="${ci.value.subPrice}">
	 </fmt:formatNumber>
	 </div>
		</td>
<c:set var="total" value="${total+ci.value.subPrice}"></c:set>
	
 </tr>
  
 
 
  </c:forEach>
  
</table>
<hr color="red">
<table width="100%" border="0">
	<tr>
	 <td colspan="4">
	 <div align="right"><strong>�ܽ�</strong></div>
	 </td>
	 <td width="16%">
	 <div align="right"><span class="style4">
	 <b><fmt:formatNumber type="currency" value="${total}">
	 </fmt:formatNumber></b>
	 </span></div>
	 </td>
	 <td width="19%">
	 <c:if test="${sessionScope.cartInfo!=null}">
	 <a href="addordersServlet">���ɶ���</a>
	 </c:if>
	    </td>
	  </tr>
	  </table>
  </body>
</html>


    