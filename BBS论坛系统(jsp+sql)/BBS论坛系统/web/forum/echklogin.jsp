<% option explicit%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="INC/const.jsp"%>
<%
try{

   	String action=ParamUtil.getString(request,"action");
	if(action!=null&&action.equals("chklogin")){
		userName=ParamUtil.getString(request,"userName");
		userPassword=ParamUtil.getString(request,"userPassword");
		if(userName==null||userPassword==null||userPassword.trim().equals("")||userName.trim().equals(""))
			throw new Exception("�����������û��������롣");
		User adminUser=SkinUtil.userLogin(userName,userPassword,4);
		if(adminUser.getUserClass()<20)
			throw new Exception("������ϵͳ����Ա");

		session.setAttribute("adminFlag","online");
		response.sendRedirect("admin_main.jsp");

		Errmsg=Errmsg+"<br>"+"<li>���������Ա���롣"
		founderr=true
	end if
	if founderr=true then
		call error()
	else
	set ars=server.createobject("adodb.recordset")
	asql="select * from admin where password='"&masterpass&"' and username='"&masterName&"' and flag=1"
	ars.open asql,conn,1,1
 	if not(ars.bof and ars.eof) then
 		if masterpass=ars("password") then
	  		session("masterlogin")="superadmin"
	  		session("mastername")=ars("username")
          		session("manageboard")=boardID
			Response.Redirect "admin_main.jsp"
   			ars.close
			set ars=nothing
 		else
			Errmsg=Errmsg+"<br>"+"<li>������Ĺ���Ա���ƺ����벻��ȷ��"
			call error()
 		end if
	else
			Errmsg=Errmsg+"<br>"+"<li>������Ĺ���Ա���ƺ����벻��ȷ��"
			call error()
	end if
	end if
%>
