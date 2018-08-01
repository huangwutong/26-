<%@ page language="java" pageEncoding="GB18030"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<jsp:include flush="true" page="/teacher/teachertop.jsp"></jsp:include>
<center>
<img src="../image/ba_goriyo-annai3.gif" width="300" height="30"> 
   <br>
<table width="675" border="0" cellspacing="0" cellpadding="0">
<tr> 
   <td width="675" background="../image/line_banner.gif"><img src="../image2/spacer.gif" width="1" height="2"></td>
</tr>
</table><br>&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">${message}&nbsp;</font>
<br>
<html:form action="/teacher/subject/updatedo" method="post" onsubmit="return checksubjectform(this)">
<html:hidden property="subjectid"/>
<table width="350"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#3D7BA3">
      <tr >
      	<td align="center" bgcolor="94C9E7">��Ŀ����</td>
      	<td  align="left" bgcolor="ffffff"><html:text property="name"/></td>
      </tr>  
      <tr >
      	<td align="center" bgcolor="94C9E7">ʱ��</td>
      	<td align="left" bgcolor="ffffff"><html:text property="time"/>����</td>
      </tr>  
      <tr >
      	<td align="center" bgcolor="94C9E7">״̬</td> 
      	<td align="left" bgcolor="ffffff"><html:radio property="state" value="1"/>����&nbsp;&nbsp;<html:radio property="state" value="0"/>�ر�</td>
      </tr>       
      <tr  >
      	<td align="center" bgcolor="94C9E7">����</td>
      	<td align="left" bgcolor="ffffff"><html:textarea property="intro" cols="40" rows="4"/></td>
      </tr>  

</table>  	
<br>
<div align="center"><html:submit value="�޸�" />&nbsp;&nbsp;<html:reset value="����" />
</html:form>
<br>
<script>

	function checksubjectform(sf){
		var message = "";
		var i = 1;
		if(sf.name.value.length==0||sf.name.value.length>15){
			message += i+") ��Ŀ����ֻ��Ϊ1-15���ַ�\n";
			i++;
		}
		if(!isTime(sf.time.value)){
			message += i+") ʱ�����Ϊ1-1000������\n";
			i++;
		}
		
		if(sf.intro.value==""||sf.intro.value.length>300){
			message += i+") ��������Ϊ����С��300��\n";
			i++;
		}
		
		if(message!=""){
			alert(message);
			return false;
		}else{
			return true;
		}
											
	}
	
	function isTime(s){
		var patrn=/^(\d){1,4}$/;
		if (!patrn.exec(s)) {
			return false;
		}
		if(parseInt(s)<1||parseInt(s)>1000){
			return false;
		}
		return true;
	}
</script> 
<jsp:include flush="true" page="/teacher/teacherbottom.jsp"></jsp:include>