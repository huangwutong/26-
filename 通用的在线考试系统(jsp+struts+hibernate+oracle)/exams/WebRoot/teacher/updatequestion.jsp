<%@ page language="java" pageEncoding="GB18030" import="com.xdf.exams.bean.*"%>

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
<div align="left">
<html:link page="/teacher/subject/show.do">ȫ����Ŀ</html:link>&gt;&gt;
<html:link page="/teacher/subject/showquestion.do?subjectid=${subject.subjectid}">${subject.name}</html:link>&nbsp;������:${subject.totalnum==null?0:subject.totalnum}&nbsp;�ܷ���:${subject.totalscore==null?0:subject.totalscore}<br>
</div>
<html:form action="/teacher/subject/updatequestiondo" method="post" onsubmit="return checkquestionform(this)">
<html:hidden property="subjectid"/> 
<html:hidden property="questionid"/> 
<table width="450"  border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#3D7BA3">
      <tr>
      	<td align="center" bgcolor="94C9E7">��Ŀ����</td>
      	<td align="left" bgcolor="ffffff" colspan="2"><html:textarea property="content" cols="65" rows="6"/></td>
      </tr>  
      <tr>
      	<td align="center" bgcolor="94C9E7">����</td>
      	<td align="left" bgcolor="ffffff" colspan="2"><html:text property="score" size="3"/>��</td>
      </tr>  
      <tr>
      	<td align="center" bgcolor="94C9E7">����</td> 
      	<td align="left" bgcolor="ffffff" colspan="2"><html:radio property="qtype" value="0"/>��ѡ��&nbsp;&nbsp;<html:radio property="qtype" value="1"/>��ѡ��</td>
      </tr>       
      <%for(int i=0;i<8;i++){
      pageContext.setAttribute("i",new Integer(i),pageContext.PAGE_SCOPE);
      %>
      <tr>
      	<td align="center" bgcolor="94C9E7"><%char c=(char)('A'+i);out.print(c);pageContext.setAttribute("c",c+"",pageContext.PAGE_SCOPE);%></td>
		<td align="center" bgcolor="ffffff"><html:multibox property="rightanswers" value="${c}"/></td>      	
      	<td align="left" bgcolor="ffffff"><html:textarea property="options" cols="60" rows="1" value="${questionForm.options[i]}"/></td>
      </tr> 
      <%}%>                         
</table>  	
<html:submit value="�޸�" />&nbsp;&nbsp;<html:reset value="����" />
</html:form>
</center>
<script>

	function checkquestionform(sf){
		var message = "";
		var i = 1;
		if(sf.content.value.length==0||sf.content.value.length>1000){
			message += i+") ��Ŀ����Ϊ1-1000���ַ�\n";
			i++;
		}
		if(!isScore(sf.score.value)){
			message += i+") ��������Ϊ1-100������\n";
			i++;
		}
		var b = 0;
		for (a=0;a<sf.rightanswers.length;a++){
			if (sf.rightanswers[a].checked==true){
				b++;
			}
		}
		if(b==0){
			message += i+") û����ȷ��\n";
			i++;
		}else if(sf.qtype[0].checked&&b>1){
			message += i+") ��ѡ��ֻ����һ����ȷ��\n";
			i++;
		}
		
		if(b!=0){
			for (a=0;a<sf.rightanswers.length;a++){
				if (sf.rightanswers[a].checked==true&&sf.options[a].value==""){
					message += i+") ��ȷ�𰸱���������\n";
					i++;
					break;
				}
			}			
		}
		var x = 0;
		for (a=0;a<sf.options.length;a++){			
			if (sf.options[a].value!=""){
				x++;
			}
		}			
		if(x<=1){
			message += i+") ����������ѡ��\n";
			i++;
		}		
		var t = -1;
		for (a=sf.options.length-1;a>=0;a--){
			if (t==-1&&sf.options[a].value!=""){
				t = a;
			}
			if(a<t&&sf.options[a].value==""){
				message += i+") ��֮�䲻�ܳ��ֿ�ֵ\n";
				i++;
				break;
			}
		}			
		
		
		if(message!=""){
			alert(message);
			return false;
		}else{
			return true;
		}
											
	}
	
	function isScore(s){
		var patrn=/^(\d){1,3}$/;
		if (!patrn.exec(s)) {
			return false;
		}
		if(parseInt(s)<1||parseInt(s)>100){
			return false;
		}
		return true;
	}
</script> 
<jsp:include flush="true" page="/teacher/teacherbottom.jsp"></jsp:include>