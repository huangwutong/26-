<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����ͼ��</title>
<jsp:useBean id="books" class="BookShop.MyDb" scope="page"/><link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<script language="javascript" src="../css/bs.js"></script>
</head>
<body> 
<p>&nbsp;</p> 
<form name="form1" method="post" action="books_add_save.jsp" onSubmit="return addbooks()"> 
  <table width="441"  border="1" align="center" cellpadding="-1" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#0066ff" bordercolordark="#FFFFFF" > 
    <caption> 
    <div class="two">�����ͼ��</div> 
    <p></p> 
    </caption> 
    <tr> 
      <td width="84" height="22" align="center" >ͼ���ţ� </td> 
      <td width="241" height="22" ><input name="idbook" type="text" maxlength="14"></td> 
      <td width="122" height="22" align="center" >ͼ�����</td> 
    </tr> 
    <tr> 
      <td height="22" align="center">ͼ�����ƣ�</td> 
      <td height="22"><input name="bookname" type="text" maxlength="40"></td> 
      <td width="122" rowspan="6" align="center" valign="middle"  ><p> 
          <input name="imageurl" type="text" size="10"> 
        </p> 
        <p>������дͼƬ����</p></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">ͼ�����</td> 
      <td height="22"><select name="idcategory"> 
<%
	String sqls="SELECT * FROM category";
	Statement stmt=books.getstmtread();
	ResultSet rs=stmt.executeQuery(sqls);
	while(rs.next()){
	int idcategory=rs.getInt("idcategory");
	String categoryname=rs.getString("categoryname");
		categoryname=books.outStr(categoryname);
        out.print("<option value="+idcategory+">"+categoryname+"</option>");
	}
	books.close();
%> 
        </select></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">�� Ӧ �̣�</td> 
      <td height="22"><select name="idsupplier"> 
<%
	String sqls1="SELECT * FROM supplier";
	Statement stmt1=books.getstmtread();
	ResultSet rs1=stmt1.executeQuery(sqls1);
	while(rs1.next()){
	int idsupplier=rs1.getInt("idsupplier");
	String suppliername=rs1.getString("suppliername");
		suppliername=books.outStr(suppliername);
          out.print("<option value="+idsupplier+">"+suppliername+"</option> ");
	}
	books.close();
%> 
        </select></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">�������ڣ�</td> 
      <td height="22"><input name="outday" type="text" maxlength="20">
      ��-��-��</td> 
    <tr> 
      <td height="22" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;�ߣ�</td> 
      <td height="22"><input name="author" type="text" maxlength="20"></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;�ۣ�</td> 
      <td height="22"><input name="cost" type="text"></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">����(��)�� </td> 
      <td height="22"><input name="stock" type="text"></td> 
      <td width="122" >��&nbsp;&nbsp;����
        <input type="checkbox" name="active" value="1"></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;�ۣ�</td> 
      <td height="22"><input name="price" type="text"></td> 
      <td width="122" >�ȵ��飺
        <input type="checkbox" name="hotdeal" value="1"></td> 
    </tr> 
    <tr> 
      <td height="70" align="center" valign="middle">��&nbsp;&nbsp;&nbsp;&nbsp;�飺</td> 
      <td colspan="2"><textarea name="details" cols="35" rows="6"></textarea></td> 
    </tr> 
  </table> 
  <p></p> 
  <div align="center"> 
    <input type="submit" name="Submit2" value="���"> 
&nbsp;&nbsp;&nbsp; 
    <input type="reset" name="Submit" value="����"> 
  </div> 
</form> 
</body>
</html>
