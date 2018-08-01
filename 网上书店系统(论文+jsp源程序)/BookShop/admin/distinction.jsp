<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>等级设定</title>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<jsp:useBean class="BookShop.MyDb" id="dis" scope="page"/></head>
<body> 
<p>&nbsp;</p> 
<%!
	int iddistinction,select;
	float limitprice,discount;
%> 
<%
	try{
	select=Integer.parseInt((String)request.getParameter("select"));
	}catch(Exception e){
	}
	if(select==0){
	select=0;
	}
%> 
<table width="318" border="1" align="center" cellpadding="-1" cellspacing="0" bordercolor="#ffffff" bordercolorlight="#0066ff" bordercolordark="#ffffff"> 
  <caption class="two">
   等级设定 
  <p>  
  </caption> 
	<form name="form1" method="post" action=""> 
  <tr> 
    <td width="88" height="27" align="center">会员等级</td> 
    <td width="224" height="27" align="center"> 
        <select name="select" onChange="javascript:submit()"> 
          <%
	String sqls="SELECT iddistinction FROM distinction";
	Statement stmt=dis.getstmtread();
	ResultSet rs=stmt.executeQuery(sqls);
	while(rs.next()){
		if(rs.getInt(1)==6){
			break;
		}else{
			iddistinction=rs.getInt(1);
	}
%> 
          <option value="<%=iddistinction%>" 
<%
	if(iddistinction==select){
	out.print("selected");
	}
%>
><%=iddistinction%>级会员</option> 
          <%
	}
	dis.close();
%> 
        </select> 
	  </td> 
  </tr> 
  </form>
  <%
		String sqls1="SELECT limitprice,discount FROM distinction WHERE iddistinction="+select;
		Statement stmt1=dis.getstmtread();
		ResultSet rs1=stmt1.executeQuery(sqls1);
		while(rs1.next()){
			limitprice=rs1.getInt(1);
			discount=rs1.getInt(2);
%> 
  <form name="form2" method="post" action="distinction_save.jsp"> 
  <tr> 
    <td height="27" align="center">限制金额</td> 
    <td height="27" align="center"> 
	<input type="text" name="limitprice" value="<%=limitprice%>"> </td> 
  </tr> 
  <tr> 
    <td height="27" align="center">折扣率</td> 
    <td height="27" align="center"> 
	<input type="text" name="discount" value="<%=discount%>"> </td> 
  </tr> 
  <tr> 
    <td height="27" colspan="2" align="center">
    <input type="submit" name="Submit" value="设定"></td> 
    <input type="hidden" name="select1" value="<%=select%>"></td> 
  </tr> 
  </form> 
<%
		}
		dis.close();
%> 
</table> 
<table width="318" border="0" align="center">
  <tr>
    <td height="40" align="right" valign="bottom" class="red12">
<%
	String msg=(String)session.getAttribute("msg");
	if(msg!=null){
		out.print(msg);
	}
	session.removeAttribute("msg");
%></td>
  </tr>
</table>
<p>&nbsp;</p>
</body>
</html>
