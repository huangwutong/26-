<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="../error/error.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>ͼ������</title>
<jsp:useBean id="books" class="BookShop.MyDb" scope="page"/>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<script language="javascript" src="../css/bs.js"></script>
<%! 
	String idbook,bookname,sqlu,tidbook,host;
	int vote;
%>
</head>
<body topmargin="0" > 
<form action="" method="post">
<p>&nbsp;</p>
<table width="556"  border="1" align="center" cellpadding="-1" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#0066ff" bordercolordark="#FFFFFF" > 
  <caption> 
  <div class="two">ͼ������</div> 
  <p></p> 
  </caption> 
  <tr>
    <td width="61" height="22" align="center">ͶƱ</td>
    <td width="127" align="center">ͼ����</td>
    <td width="238" align="center">ͼ������</td>
    <td width="120" align="center">Ʊ��</td>
  </tr> 
<%
	String bookvote=(String)request.getParameter("radiobutton");
		if(bookvote!=null){
			host=(String)request.getRemoteHost();
			if(session.getAttribute("host")!=null){
				response.sendRedirect("../error/errorpage.jsp");
				session.setAttribute("error","���Ѿ�Ͷ��Ʊ��");
			}else{
				session.setAttribute("host",host);
				String sqls5="SELECT vote FROM feedback WHERE idbook='"+bookvote+"'";
				Statement stmt5=books.getstmtread();
				ResultSet rs5=stmt5.executeQuery(sqls5);
				if(rs5.next()){
					int tempvote=rs5.getInt(1);
					tempvote++;
					books.close();
					String sqlu6="UPDATE feedback SET vote="+tempvote+" WHERE idbook='"+bookvote+"'";
					Statement stmt6=books.getstmtread();
					tempvote=stmt6.executeUpdate(sqlu6);
					if(tempvote>0)
						request.setAttribute("read","ͶƱ�ɹ�");
					books.close();
				}else{
					books.close();
				}
			}//host
		}//bookvote
	//ͳ�Ʒ�����
	String sqlu="SELECT idbook from books where idbook not in (select idbook from feedback) and active=1";
	Statement stmt1=books.getstmtread();
	ResultSet rs1=stmt1.executeQuery(sqlu);
	//û��ͼ�鷢��ʱ
	if(!rs1.next()){
		books.close();
		String sqls4="SELECT idbook FROM feedback";
		Statement stmt4=books.getstmtread();
		ResultSet rs4=stmt4.executeQuery(sqls4);
		if(!rs4.next()){
			String sqlu2="SELECT idbook FROM books WHERE active=1";
			Statement stmt2=books.getstmtread();
			ResultSet rs2=stmt2.executeQuery(sqlu2);
			while(rs2.next()){
				String sqli3="INSERT INTO feedback(idbook) VALUES('"+rs2.getString(1)+"')";
				Statement stmt3=books.getstmt();
				stmt3.executeUpdate(sqli3);
				books.close();
			}
			books.close();
		}//rs4
		books.close();
	}else{
		//�з���ͼ��ʱ
		rs1.previous();
		while(rs1.next()){
			String sqli="INSERT INTO feedback(idbook) VALUES('"+rs1.getString(1)+"')";
			Statement stmt2=books.getstmt();
			stmt2.executeUpdate(sqli);
			books.close();
		}
		books.close();
	}
	//������ͶƱ
	String sqls="SELECT b.idbook,bookname,b.vote FROM books AS a,feedback AS b WHERE active=1 AND a.idbook=b.idbook";
	Statement stmt=books.getstmtread();
	ResultSet rs=stmt.executeQuery(sqls);
	if(!rs.next()){
%>
  <tr>
    <td height="40"  colspan="4"  align="center" class="red12">���޷�����ͼ��</td>
  </tr> 
<%
		books.close();
	}
	rs.previous();
	while(rs.next()){
		idbook=rs.getString(1);
		bookname=rs.getString(2);
		vote=rs.getInt(3);
		idbook=books.outStr(idbook);
		bookname=books.outStr(bookname);
%>
  <tr>
    <td width="61" height="22" align="center">
	<input type="radio" name="radiobutton" value="<%=idbook%>"></td>
    <td width="127" height="22" align="center"><%=idbook%></td>
    <td width="238" align="center"><%=bookname%></td>
    <td width="120" align="center"><%=vote%>
	</td>
  </tr> 
<%
 	}
	books.close();
	pageContext.removeAttribute("books");
%>
</table> 
<table width="556" border="0" align="center">
  <tr>
    <td width="573" height="58" align="center" valign="bottom"><input type="submit" name="Submit" value="ͶƱ">
</td>
  </tr>
  <tr>
    <td height="44" align="right" valign="bottom" class="red12"><%
	if(request.getAttribute("read")!=null){
		out.print(request.getAttribute("read"));
		request.removeAttribute("read");
	}
	%></td>
  </tr>
  <tr>
    <td height="37" align="right" valign="bottom" class="red12"> ���������Ƽ���ͼ�飬��������ѡ������ϲ�����飡����</td>
  </tr>
</table>
</form>
</body>
</html>
