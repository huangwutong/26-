<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�޸�ͼ����Ϣ</title>
<jsp:useBean id="books" class="BookShop.MyDb" scope="page"/><link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<script language="javascript" src="../css/bs.js"></script>
</head>
<body> 
<p>&nbsp;</p> 
<form name="form1" method="post" action="bookchange_save.jsp" onSubmit="return addbooks(this)"> 
  <table width="392"  border="1" align="center" cellpadding="-1" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#0066ff" bordercolordark="#FFFFFF" > 
    <caption> 
    <div class="two">�޸�ͼ����Ϣ</div> <p></p> 
    </caption> 
<%! String cost,idbook,price,bookname,author,details,imageurl;
	int stock,sale,active,hotdeal,idsupplier1,idcategory1;
	java.util.Date outday;
%> 
<%
	idbook=(String)request.getParameter("idbook");
	String sqls2="SELECT * FROM books  WHERE idbook='"+idbook+"'";
	Statement stmt2=books.getstmtread();
	ResultSet rs2=stmt2.executeQuery(sqls2);
	if(rs2.next()){
		idbook=rs2.getString("idbook");
		idcategory1=rs2.getInt("idcategory");
		bookname=rs2.getString("bookname");
		author=rs2.getString("author");
		idsupplier1=rs2.getInt("idsupplier");
		outday=rs2.getDate("outday");
		details=rs2.getString("details");
		cost=rs2.getString("cost");
		price=rs2.getString("price");
		imageurl=rs2.getString("imageurl");
		stock=rs2.getInt("stock");
		active=rs2.getInt("active");
		hotdeal=rs2.getInt("hotdeal");
		sale=rs2.getInt("sale");
%> 
    <tr> 
      <td width="85" height="22" align="center" >ͼ���ţ� </td> 
      <td width="198" height="22" ><input name="idbook" type="text" maxlength="14" value="<%=idbook%>" readonly></td> 
      <td width="101" height="22" align="center" >ͼ�����</td> 
    </tr> 
    <tr> 
      <td height="22" align="center">ͼ�����ƣ�</td> 
      <td height="22"><input name="bookname" type="text" maxlength="40" value="<%=bookname%>"></td> 
      <td width="101" rowspan="7" align="center" valign="middle"  >
        <p><input name="imageurl" type="text" size="10" value="<%=imageurl%>"></p> 
        <p>������дͼƬ����</p></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">ͼ�����</td> 
      <td height="22">
	  <select name="idcategory"> 
<%
	books.close();
	String sqls="SELECT * FROM category";
	Statement stmt=books.getstmtread();
	ResultSet rs=stmt.executeQuery(sqls);
	while(rs.next()){
	int idcategory=rs.getInt("idcategory");
	String categoryname=rs.getString("categoryname");
		categoryname=books.outStr(categoryname);
        out.print("<option value="+idcategory);
		if(idcategory1==idcategory){
			out.println(" selected ");
		}
		out.print(">"+categoryname+"</option>");
	}
	books.close();
%> 
        </select></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">�� Ӧ �̣�</td> 
      <td height="22">
	  <select name="idsupplier"> 
<%
	String sqls1="SELECT * FROM supplier";
	Statement stmt1=books.getstmtread();
	ResultSet rs1=stmt1.executeQuery(sqls1);
	while(rs1.next()){
	int idsupplier=rs1.getInt("idsupplier");
	String suppliername=rs1.getString("suppliername");
		suppliername=books.outStr(suppliername);
          out.print("<option value="+idsupplier);
		  if(idsupplier1==idsupplier){
			  out.println(" selected ");
		  }
		  out.print(">"+suppliername+"</option> ");
	}
	books.close();
%> 
        </select></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">�������ڣ�</td> 
      <td height="22"><input name="outday" type="text" maxlength="20" value="<%=outday%>"></td> 
    <tr> 
      <td height="22" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;�ߣ�</td> 
      <td height="22"><input name="author" type="text" maxlength="20" value="<%=author%>"></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;�ۣ�</td> 
      <td height="22"><input name="cost" type="text" value="<%=cost%>"></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">����(��)�� </td> 
      <td height="22"><input name="stock" type="text" value="<%=stock%>"></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;�ۣ�</td> 
      <td height="22"><input name="price" type="text" value="<%=price%>"></td> 
      <td width="101" >��&nbsp;&nbsp;����
      <input name="active" type="checkbox"  value="1"
<%
	if(active==1){
		out.print("checked");
	}
%>
	 ></td> 
    </tr>
    <tr>
      <td height="22" align="center">����(��)��</td>
      <td height="22"><input name="sale" type="text" value="<%=sale%>" readonly></td>
      <td width="101" >�ȵ��飺
      <input type="checkbox" name="hotdeal"  value="1"
<%
	if(hotdeal==1){
		out.print("checked");
	}
%>
	></td>
    </tr> 
    <tr> 
      <td align="center" valign="middle">��&nbsp;&nbsp;&nbsp;&nbsp;�飺</td> 
      <td colspan="2"><textarea name="details" cols="35" rows="4"><%=details%></textarea ></td> 
    </tr> 
<%
	}
	pageContext.removeAttribute("books");
%> 
  </table> 
  <p></p> 
  <div align="center"> 
    <input type="submit" name="Submit2" value="����"> 
&nbsp;&nbsp;&nbsp; 
    <input type="reset" name="Submit" value="����"> 
  </div> 
</form> 
</body>
</html>