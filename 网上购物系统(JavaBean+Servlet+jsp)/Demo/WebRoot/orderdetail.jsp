<%@ page language="java" contentType="text/html;charset=GB2312" import="java.util.*"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt"%>
<html>
  <head>
    <title>������ϸ�б�ҳ��</title>

  </head>
  
  <body>
	  <table width="100%"  border="0">
	  <caption>
	  <b>${user.uname}</b> �Ķ�����ϸ��
	  </caption>
	  <tr>
	    <td>ͼ������</td>
	    <td>�۸�</td>
	    <td>����</td>
	    <td>״̬</td>
	    <td>&nbsp;</td>
	  </tr>
	  <c:forEach var="o" items="${orderdetails}">
	  <tr>
	    <td>${o.bname}</td>
	    <td>${o.price}</td>
	    <td>${o.num}</td>
	    <td>${o.status}</td>
	    <td><c:if test="${sessionScope.user.userID!=1001}">
	    <a href="deleteorderdetailServlet?orderdetailID=${o.orderdetailno}">ɾ��</a>
	    </c:if>
	    </td>
	  </tr>
	  </c:forEach>
	</table>
  </body>
</html>

