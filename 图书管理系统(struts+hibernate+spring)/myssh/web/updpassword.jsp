<%@ page language="java" contentType="text/html;charset=GB2312"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<META content="text/html; charset=gb2312" http-equiv=Content-Type>
    <title>login.jsp</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/laodong.css" type="text/css">
    <SCRIPT language=JavaScript>
      <!-- 
     function updpasswordsave(){
     	  var oldpass = document.all("password").value;
     	  var pass = document.all("newpassword").value;
     	  var queren = document.all("queren").value;
        if(oldpass==""){
     	  	alert("�����벻��Ϊ�գ�");
     	  	return;
     	  }
     	  if(pass==""){
     	  	alert("���벻��Ϊ�գ�");
     	  	return;
     	  }
     	  if(pass!=queren){
     	  	alert("�����������벻һ�£�");
     	  	return;
     	  }
   			document.loginForm.action="<%=request.getContextPath()%>/login.do?method=updpasswordsave";
   	    document.loginForm.submit();		
   		}
   		function enter(){
   			window.location.href="index.jsp";		
   		}
      -->
    </SCRIPT>
  </head>
  <body TEXT="#336699" BGPROPERTIES=FIXED>
    <html:form action="/login">
    	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    	<% pageContext.include("/pub/util/ErrorInclude.jsp"); %>	
    	<div style="LINE-HEIGHT: 29px;" align=center><font size=2>�޸�����</font></div>
     <table width="30%" border="0" align=center>
     	<tr>
         <td align="right">��&nbsp;&nbsp;��&nbsp;��:</td>
         <td><html:password property="password" style="width:176;" redisplay="true"/><font color=red>*</font></td>
      </tr>
      <tr>
         <td align="right">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��:</td>
         <td><html:password property="newpassword" style="width:176;" redisplay="true"/><font color=red>*</font></td>
      </tr>
      <tr>
         <td align="right">ȷ������:</td>
         <td><input type="password" name="queren" style="width:176;" redisplay="true"/><font color=red>*</font></td>
      </tr>
    <tr><td colspan=2 align="center">&nbsp;</td></tr>
      <tr>
         <td colspan=2 align="center">
         	<input type="button" value="�޸�" onclick="updpasswordsave()"/>&nbsp;
  	      <input type="button" value="�ο�" onclick="enter()"/>
  	     </td>
      </tr>
    </table>  <br><br><br><br><br><br><br><br><br><br><br>
    </html:form>
  </body>
</html>
