<%@ page language="java" pageEncoding="GB18030"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<jsp:include flush="true" page="/teacher/teachertop.jsp"></jsp:include>
<center>
<img src="../image/ba_goriyo-annai6.gif" width="300" height="30"> 
   <br>
<table width="675" border="0" cellspacing="0" cellpadding="0">
<tr> 
   <td width="675" background="../image/line_banner.gif"><img src="../image2/spacer.gif" width="1" height="2"></td>
</tr>
</table><br>&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">${message}&nbsp;</font>
<table width="300"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#3D7BA3">
<html:form action="/teacher/admin/updatedo" method="post" onsubmit="return checkteacherform(this)">
<html:hidden property="teacherid"/>
 	<tr>
      <td align="center" bgcolor="94C9E7">�û���</td>
      <td align="left" bgcolor="FFFFFF">${teacherForm.username}</td>
    </tr>
 	<tr>
      <td align="center" bgcolor="94C9E7">����</td>
      <td align="left" bgcolor="FFFFFF"><html:password property="password" style="width:200px"  redisplay="false"/></td>
    </tr>
 	<tr>
      <td align="right" colspan="2" bgcolor="FFFFFF"><html:reset value="����"/>&nbsp;&nbsp;&nbsp;&nbsp;<html:submit value="����"/>&nbsp;&nbsp;&nbsp;</td>
    </tr>      
</html:form>             	
</table></center>  
<script>
	function checkteacherform(sf){
		var message = "";
		var i = 1;
		if(!isUsername(sf.username.value)){
			message += i+") �û���ֻ������4-30����ĸ�����֡��»���\n";
			i++;
		}
		if(!isUsername(sf.password.value)){
			message += i+") ����ֻ������4-30����ĸ�����֡��»���\n";
			i++;
		}
		if(message!=""){
			alert(message);
			return false;
		}else{
			return true;
		}
											
	}
	//У���û�����ֻ������4-20����ĸ�����֡��»���
	function isUsername(s){
		var patrn=/^(\w){4,30}$/;
		if (!patrn.exec(s)) 
			return false;
		return true;
	}	
</script>
<jsp:include flush="true" page="/teacher/teacherbottom.jsp"></jsp:include>