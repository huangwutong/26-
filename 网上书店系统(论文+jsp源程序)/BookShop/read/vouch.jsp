<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="../error/error.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>ͼ������</title>
<jsp:useBean id="books" class="BookShop.MyDb" scope="page"/><link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<script language="javascript" src="../css/bs.js"></script>
<%! 
	String idbook,bookname,sqlu,tidbook,host,select;
	int vote,temp;
%>
</head>
<body topmargin="0"> 
<p>&nbsp;</p> 
<table width="556"  border="1" align="center" cellpadding="-1" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#0066ff" bordercolordark="#FFFFFF" > 
  <caption> 
  <div class="two">�����Ƽ�</div> 
  <p></p> 
  </caption> 
  <tr> 
    <td width="383" height="27" align="center">ͼ���б�</td> 
    <td width="167" height="27" align="center">�Ƽ�����</td> 
  </tr> 
  <%
	//û�е�ǰͼ��������ͼ��
	select=(String)request.getParameter("select");
	bookname=(String)request.getParameter("bookname");
	select=books.inStr(select);
	bookname=books.inStr(bookname);
	boolean flag=false;	
	if(bookname!=null&&bookname!=""){
		flag=true;
	}
	if(flag){
		String sqls1="SELECT bookname,vote FROM vouch WHERE bookname='"+bookname+"'";
		String sqli="INSERT INTO vouch(bookname) VALUES('"+bookname+"')";
		Statement stmt=books.getstmtread();
		ResultSet rs=stmt.executeQuery(sqls1);
		if(!rs.next()){
		//û�е�ǰͼ����������
			books.close();
			Statement stmt1=books.getstmt();
			temp=stmt1.executeUpdate(sqli);
			if(temp<=0){
				session.setAttribute("error","ϵͳ����������������");
				response.sendRedirect("../error/errorpage.jsp");
			}
			books.close();
 		}else{
			//�е�ǰͼ������Ʊ��
			rs.beforeFirst();
			if(rs.next()){
				vote=rs.getInt(2);
				vote++;
				books.close();
				String sqlu="UPDATE vouch SET vote="+vote+" WHERE bookname='"+bookname+"'";
				Statement stmt2=books.getstmt();
				temp=0;
				temp=stmt2.executeUpdate(sqlu);
				if(temp<=0){
					response.sendRedirect("../error/errorpage.jsp");
					session.setAttribute("error","ϵͳ����������������");
				}
				books.close();
			}
		}//if rs.next
	}//if flag
	//�鿴�Ƽ�ͼ��
	String sqls="SELECT bookname,vote FROM vouch ";
	Statement stmt2=books.getstmtread();
	ResultSet rs2=stmt2.executeQuery(sqls);
	if(!rs2.next()){
%> 
  <tr> 
    <td height="40"  colspan="2"  align="center" class="red12">���޶����Ƽ�ͼ��</td> 
  </tr> 
<%
		books.close();
	}else{
		rs2.beforeFirst();
%> 
  <form action="" method="post" name="form1" > 
    <tr> 
      <td height="27"  align="center" valign="middle"> 
	  <select name="select" onChange="Jscript:submit()"> 
<%
		while(rs2.next()){
			bookname=rs2.getString(1);
%> 
          <option value="<%=bookname%>" 
<%
				if(bookname.equals(select)) out.print("selected"); 
%>
	   	  ><%=bookname%></option> 
<%
		}
		rs2.beforeFirst();
		if(rs2.next()){
		bookname=rs2.getString(1);
		}
		books.close();
		if(select==""){
		select=bookname;
		}
%> 
        </select> 
	  </td>
      <td height="27"  align="center">&nbsp;
<%
		String sqls2="SELECT vote FROM vouch WHERE bookname='"+select+"'";
		stmt2=books.getstmtread();
		rs2=stmt2.executeQuery(sqls2);
		if(rs2.next()){
			vote=rs2.getInt(1);		
			out.print(vote);
		}
		books.close();
%>	 </td> 
    </tr> 
  </form> 
<%
	}
//	pageContext.removeAttribute("books");
%> 
  <form action="" method="post" name="form2" onSubmit="return vouch()"> 
    <tr> 
      <td height="30" colspan="2"  align="center"> <input name="bookname" type="text" size="30" maxlength="40" value=""></td> 
    </tr> 
    <tr valign="middle"> 
      <td height="58" align="center" colspan="2"> <input type="submit" name="Submit" value="�Ƽ�" > </td> 
    </tr> 
  </form> 
  <tr align="center" valign="middle"> 
    <td height="59" class="red12" colspan="2">�����ǹ������Լ������Ƽ���ͼ�飬��Ҳ�����������������Ϊ��ϲ�����飡����</td> 
  </tr> 
</table> 
</body>
</html>
