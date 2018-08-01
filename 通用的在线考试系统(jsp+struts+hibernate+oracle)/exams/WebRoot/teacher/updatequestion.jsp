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
<html:link page="/teacher/subject/show.do">全部科目</html:link>&gt;&gt;
<html:link page="/teacher/subject/showquestion.do?subjectid=${subject.subjectid}">${subject.name}</html:link>&nbsp;总题数:${subject.totalnum==null?0:subject.totalnum}&nbsp;总分数:${subject.totalscore==null?0:subject.totalscore}<br>
</div>
<html:form action="/teacher/subject/updatequestiondo" method="post" onsubmit="return checkquestionform(this)">
<html:hidden property="subjectid"/> 
<html:hidden property="questionid"/> 
<table width="450"  border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#3D7BA3">
      <tr>
      	<td align="center" bgcolor="94C9E7">题目内容</td>
      	<td align="left" bgcolor="ffffff" colspan="2"><html:textarea property="content" cols="65" rows="6"/></td>
      </tr>  
      <tr>
      	<td align="center" bgcolor="94C9E7">分数</td>
      	<td align="left" bgcolor="ffffff" colspan="2"><html:text property="score" size="3"/>分</td>
      </tr>  
      <tr>
      	<td align="center" bgcolor="94C9E7">类型</td> 
      	<td align="left" bgcolor="ffffff" colspan="2"><html:radio property="qtype" value="0"/>单选题&nbsp;&nbsp;<html:radio property="qtype" value="1"/>多选题</td>
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
<html:submit value="修改" />&nbsp;&nbsp;<html:reset value="重置" />
</html:form>
</center>
<script>

	function checkquestionform(sf){
		var message = "";
		var i = 1;
		if(sf.content.value.length==0||sf.content.value.length>1000){
			message += i+") 题目内容为1-1000个字符\n";
			i++;
		}
		if(!isScore(sf.score.value)){
			message += i+") 分数必须为1-100的数字\n";
			i++;
		}
		var b = 0;
		for (a=0;a<sf.rightanswers.length;a++){
			if (sf.rightanswers[a].checked==true){
				b++;
			}
		}
		if(b==0){
			message += i+") 没有正确答案\n";
			i++;
		}else if(sf.qtype[0].checked&&b>1){
			message += i+") 单选题只能有一个正确答案\n";
			i++;
		}
		
		if(b!=0){
			for (a=0;a<sf.rightanswers.length;a++){
				if (sf.rightanswers[a].checked==true&&sf.options[a].value==""){
					message += i+") 正确答案必须有内容\n";
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
			message += i+") 至少有两个选项\n";
			i++;
		}		
		var t = -1;
		for (a=sf.options.length-1;a>=0;a--){
			if (t==-1&&sf.options[a].value!=""){
				t = a;
			}
			if(a<t&&sf.options[a].value==""){
				message += i+") 答案之间不能出现空值\n";
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