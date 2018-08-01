<%@ page language="java" pageEncoding="GB18030"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<jsp:include flush="true" page="/student/studenttop.jsp"></jsp:include>
<br>
<center>
<img src="../image2/ba_goriyo-annai2.gif" width="300" height="30"> 
   <br>
<table width="675" border="0" cellspacing="0" cellpadding="0">
<tr> 
   <td width="675" background="../image2/line_banner.gif"><img src="../image2/spacer.gif" width="1" height="2"></td>
</tr>
</table><br>&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">${message}&nbsp;</font>
<table width="300"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#3D7BA3">
<html:form action="/student/info/updatedo" method="post" onsubmit="return checkstudentform(this)">
	<html:hidden property="studentid" />
 	<tr>
      <td align="center" bgcolor="94C9E7">ID��</td>
      <td align="left" bgcolor="FFFFFF">${studentForm.studentid}&nbsp;</td>
    </tr>
 	<tr>
      <td align="center" bgcolor="94C9E7">�û���</td>
      <td align="left" bgcolor="FFFFFF"><html:text property="username" style="width:100%"/></td>
    </tr>
 	<tr>
      <td align="center" bgcolor="94C9E7">����</td>
      <td align="left" bgcolor="FFFFFF"><html:text property="name"  style="width:100%"/></td>
    </tr>
 	<tr>
      <td align="center" bgcolor="94C9E7">������</td>
      <td align="left" bgcolor="FFFFFF"><html:password property="oldpassword" style="width:100%"  redisplay="false"/></td>
    </tr>
 	<tr>
      <td align="center" bgcolor="94C9E7">������</td>
      <td align="left" bgcolor="FFFFFF"><html:password property="newpassword" style="width:100%"  redisplay="false"/></td>
    </tr>    
 	<tr>
      <td align="center" bgcolor="94C9E7">�Ա�</td>
      <td align="left" bgcolor="FFFFFF"><html:radio property="sex" value="m"/>��&nbsp;
      <html:radio property="sex" value="f"/>Ů&nbsp;</td>
    </tr>      
 	<tr>
      <td align="center" bgcolor="94C9E7">��ַ</td>
      <td align="left" bgcolor="FFFFFF"><html:text property="address" style="width:100%"/></td>
    </tr>    
 	<tr>
      <td align="center" bgcolor="94C9E7">email</td>
      <td align="left" bgcolor="FFFFFF"><html:text property="email" style="width:100%"/></td>
    </tr>   
 	<tr>
      <td align="right" colspan="2" bgcolor="FFFFFF"><html:reset value="����"/>&nbsp;&nbsp;&nbsp;&nbsp;<html:submit value="�ύ"/>&nbsp;&nbsp;&nbsp;</td>
    </tr>      
</html:form>   
          	
</table></center>  
<script>
	function checkstudentform(sf){
		var message = "";
		var i = 1;
		if(!isUsername(sf.username.value)){
			message += i+") �û���ֻ������6-30����ĸ�����֡��»���\n";
			i++;
		}
		if(!isUsername(sf.oldpassword.value)||!isUsername(sf.newpassword.value)){
			message += i+") ����ֻ������6-30����ĸ�����֡��»���\n";
			i++;
		}
		if(sf.name.value==""||sf.name.value.length>15){
			message += i+") ��������Ϊ����С��15��\n";
			i++;
		}
		if(sf.address.value==""||sf.address.value.length>20){
			message += i+") ��ַ����Ϊ����С��20��\n";
			i++;
		}
		if(sf.email.value==""||sf.email.value.length>40){
			message += i+") Email����Ϊ����С��40��ĸ\n";
			i++;
		}			
		if(message!=""){
			alert(message);
			return false;
		}else{
			return true;
		}
											
	}
	//У���û�����ֻ������6-20����ĸ�����֡��»���
	function isUsername(s){
		var patrn=/^(\w){6,30}$/;
		if (!patrn.exec(s)) 
			return false;
		return true;
	}	
</script> 
<jsp:include flush="true" page="/student/studentbottom.jsp"></jsp:include>