<%@ page language="java" contentType="text/html;charset=GBK" import="java.util.*" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt"%>

<html>
  <head>
    <title>�����б�ҳ��</title>
  </head>
  
  <body>
	 <table width="100%"  border="0">
	  <caption>
	  ${user.uname}�Ķ���
	  </caption>
	  <tr>
	    <td>�������</td>
	    <td>����״̬</td>
	    <td>��������</td>
	    <td>�ͻ�����</td>
	    <td>&nbsp;</td>
	  </tr>
	  <c:forEach var="o" items="${orders}">
	  <tr>
	    <td>${o.orderno}</td>
	    <td>${o.status}</td>
	    <td>${o.orderdate}</td>
	    <td>${o.uname}</td>
	    <td>
	     <c:if test="${sessionScope.struts!=null}"><a href="updateorder?orderID=${o.orderno}">ȷ�϶���</a> |</c:if>
	      <a href="lookuporderdetails?orderID=${o.orderno}">������ϸ</a> 
	   | <a href="deleteorder?orderID=${o.orderno}">ɾ��</a>
	    </td>
	  </tr>
	  </c:forEach>
	</table>

  </body>
</html>
	