<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="../error/error.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��ҳ</title>
<jsp:useBean id="books" class="BookShop.MyDb" scope="page"/><link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<script language="javascript" src="../css/bs.js"></script>
<%! 
	String idbook,categoryname,bookname,bookselect,author,outday,details,imageurl,suppliername;
	int idcategory,hotdeal,cateselect;
	float price;
%>  
</head>
<body topmargin="0" > 
<p>&nbsp;</p> 
<table width="450"  border="1" align="center" cellpadding="-1" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#0066ff" bordercolordark="#FFFFFF" > 
  <caption> 
  <div class="two">ͼ������ѯ</div> 
  <p></p> 
  </caption> 
  <tr> 
    <td width="139" height="22" align="center">ͼ�����</td> 
<form name="form2" method="post" action="disselect.jsp">     
<td width="305" height="22" align="left" colspan="2"> 
        <select name="cateselect" onChange="javascript:submit()"> 
<%	
	String sqls="SELECT * FROM category ORDER BY idcategory";
	Statement stmt=books.getstmtread();
	ResultSet rs=stmt.executeQuery(sqls);
	if(!rs.next()){
		out.print("����ͼ�����");
	}else{
		rs.previous();
		while(rs.next()){
			idcategory=rs.getInt(1);
			categoryname=rs.getString(2);
			categoryname=books.outStr(categoryname);
%> 
          <option value="<%=idcategory%>"
<%
			try{
				cateselect=Integer.parseInt((String)request.getParameter("cateselect"));
			}catch(Exception e){
				cateselect=idcategory;
			}
			if(cateselect==idcategory) out.print("selected");
%>		
		><%=categoryname%></option> 
<%
		}//while
 	}//if
	books.close();
%> 
        </select> 
      </td>
	  </form> 
  </tr> 
  <tr> 
    <td height="22" align="center">ͼ�����ƣ�</td> 
	 <form name="form1" method="post" action="disselect.jsp"> 
    <td width="305" height="22" align="left" colspan="2">
        <select name="bookselect" onChange="javascript:submit()"> 
<%	
	String sqls1="SELECT idbook,bookname FROM books WHERE idcategory="+cateselect+" ORDER BY idbook";
	Statement stmt1=books.getstmtread();
	ResultSet rs1=stmt1.executeQuery(sqls1);
	if(!rs1.next()){
		out.print("����ͼ��");
	}else{
		rs1.previous();
		while(rs1.next()){
			idbook=rs1.getString(1);
			bookname=rs1.getString(2);
			idbook=books.outStr(idbook);
			bookname=books.outStr(bookname);
			
				bookselect=(String)request.getParameter("bookselect");
				if(bookselect==null){
					bookselect=idbook;
				}
%> 
          <option value="<%=idbook%>"
<%
			try{
				if(bookselect.equals(idbook)) out.print("selected");
			}catch(Exception e){
				idbook="";	
			}
%>		
		><%=bookname%></option> 
          <%
		}//while
 	}//if
	rs1.close();
	stmt1.close();
	books.close();
%> 
        </select> 
        <input type="hidden" name="cateselect" value="<%=cateselect%>"> 
	  </td> 
      </form>
  </tr> 
  <tr> 
    <td height="22" colspan="3" align="center" class="two">ͼ����Ϣ </td> 
  </tr> 
  <form  method="post" name="form3" action="../shop/trade.jsp"> 
    <%
	idbook=(String)request.getParameter("idbook");
	String sqls4="SELECT idbook,bookname,author,outday,details,price,imageurl,hotdeal,categoryname,suppliername FROM books as a,category as b,supplier as c  WHERE idbook='"+bookselect+"' AND a.idcategory=b.idcategory AND a.idsupplier=c.idsupplier";
	Statement stmt4=books.getstmtread();
	ResultSet rs4=stmt4.executeQuery(sqls4);
	if(rs4.next()){
		idbook=rs4.getString("idbook");
		bookname=rs4.getString("bookname");
		author=rs4.getString("author");
		outday=rs4.getString("outday");
		details=rs4.getString("details");
		price=rs4.getFloat("price");
		imageurl=rs4.getString("imageurl");
		hotdeal=rs4.getInt("hotdeal");
		categoryname=rs4.getString("categoryname");
		suppliername=rs4.getString("suppliername");
		
		idbook=books.outStr(idbook);
		bookname=books.outStr(bookname);
		author=books.outStr(author);
		outday=books.outStr(outday);
		details=books.outStr(details);
		imageurl=books.outStr(imageurl);
		categoryname=books.outStr(categoryname);
		suppliername=books.outStr(suppliername);

%> 
    <tr> 
      <td width="139" height="22" align="center" >ͼ���ţ� </td> 
      <td width="305" height="22" ><%=idbook%>&nbsp;</td> 
      <td width="123" height="22" align="center" >ͼ�����</td> 
    </tr> 
    <tr> 
      <td height="22" align="center">ͼ�����ƣ�</td> 
      <td height="22"><%=bookname%>&nbsp;</td> 
      <td rowspan="7" align="center" valign="middle"  ><p> <img src="../image/<%=imageurl%>"  width="100" height="132" border="0"> </td> 
    </tr> 
    <tr> 
      <td height="22" align="center">ͼ�����</td> 
      <td height="22"><%=categoryname%>&nbsp;</td> 
    </tr> 
    <tr> 
      <td height="22" align="center">�� Ӧ �̣�</td> 
      <td height="22"><%=suppliername%>&nbsp;</td> 
    </tr> 
    <tr> 
      <td height="22" align="center">�������ڣ�</td> 
      <td height="22"><%=outday%>&nbsp;</td> 
    <tr> 
      <td height="22" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;�ߣ�</td> 
      <td height="22"><%=author%>&nbsp;</td> 
    </tr> 
    <tr> 
      <td height="22" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;�ۣ�</td> 
      <td height="22"><%=price%></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">��&nbsp;��&nbsp;�飺</td> 
      <td height="22"><%
	if(hotdeal==1){
		out.print("��");
	}else{
		out.print("��");
	}
%></td> 
    </tr> 
    <tr> 
      <td height="70" align="center" valign="middle">��&nbsp;&nbsp;&nbsp;&nbsp;�飺</td> 
      <td colspan="2" valign="top"><%=details%>&nbsp;</td> 
    </tr> 
    <tr> 
      <td height="22" colspan="3" align="center" valign="middle"> <input type="image" src="../image/add.gif" alt="��ӹ��ﳵ"align="middle">
        <input name="action" value="add" type="hidden"> 
        <input type="hidden" name="id" value="<%=idbook%>">����ӹ��ﳵ��</td> 
    </tr> 
    <%
	}else{
%> 
    <tr> 
      <td height="70" colspan="3" align="center" valign="middle" class="red12">����ͼ��</td> 
    </tr> 
    <%
	}
	rs4.close();
	stmt4.close();
	books.close();
	pageContext.removeAttribute("books");
%> 
  </form> 
</table> 
</body>
</html>
