<%@ page language="java"  contentType="text/html; charset=gb2312"%>
<%@ include file="INC/const.jsp"%>
<html>

<head>
<title><%=forumName%>--�����½</title>
<link rel="stylesheet" href="forum.css">

</head>
<body bgcolor="#ffffff" alink="#333333" vlink="#333333" link="#333333">
<%
try{

   	String action=ParamUtil.getString(request,"action");
	if(action!=null&&action.equals("chklogin")){
		userName=ParamUtil.getString(request,"userName");
		userPassword=ParamUtil.getString(request,"userPassword");
		if(userName==null||userPassword==null||userPassword.trim().equals("")||userName.trim().equals(""))
			throw new Exception("�����������û��������롣");
		User adminUser=SkinUtil.userLogin(userName,userPassword,4);
		if(adminUser.getUserClass()<19)
			throw new Exception("������ϵͳ����Ա");

		session.setAttribute("adminFlag","online");
		session.setAttribute("adminName",userName);

		response.sendRedirect("admin_main.jsp");
	}
		%>
<div align="center"><center>

<form method="POST" action="elogin.jsp?action=chklogin">
      <table cellpadding=0 cellspacing=0 border=0 width=45% bgcolor=<%=aTableBackColor%> align=center>
        <tr>
          <td><table cellpadding=3 cellspacing=1 border=0 width=100%>
            <tr>
              <td colspan="2" height="22" bgcolor=<%=aTableTitleColor%> align=center>
����Ա��½
	      </td>
            </tr>
            <tr bgcolor=<%=tableBodyColor%>>
                      <td width="33%" align="right" height="30">�û�����</td>
              <td width="67%"><input name="userName" maxlength="20" size="20"> </td>
            </tr>
            <tr bgcolor=<%=tableBodyColor%>>
                      <td width="33%" align="right" height="30">�� �룺</td>
              <td width="67%"><input type="password" name="userPassword" maxlength="16" size="20"> </td>
            </tr>
            <tr>
              <td colspan="2" height="15" bgcolor=<%=aTableTitleColor%> align=center>
                  <input type="submit" name="Submit" value="ȷ ��"> 
          &nbsp; 
                  <input type="reset" name="Submit2" value="�� д">
	      </td>
            </tr>
          </table>
          </td>
        </tr>
      </table>
    </form>
</center></div>
<%
}
catch(Exception e){
	e.printStackTrace();
	String errMsg=e.getMessage();
	%>
	<%@include file="INC/error.jsp"%>
	<%
}%>

<%@ include file="foot.jsp"%>